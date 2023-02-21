import 'package:flutter/material.dart';

import 'card.dart';

class ListMovieWidget extends StatelessWidget {
  final int length;
  final String imagePath;
  final Function(int index)? onTap;

  const ListMovieWidget({
    super.key,
    this.onTap,
    required this.length,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return InkWell(
                  onTap: () => onTap,
                  child: CardMovie(
                    path: imagePath,
                  ),
                );
              },
              childCount: length,
            ),
          ),
        ),
      ],
    );
  }
}
