import 'package:flutter/material.dart';
import '../../../support/components/card.dart';

abstract class FavoriteViewModelProtocol extends ChangeNotifier {
  int get length;
  String get title;
  bool get isEmpty;
  bool get isLoading;

  void didTap(int index);
  Future<void> getMovie();
  String imagePath(int index);
}

class FavoriteView extends StatelessWidget {
  final FavoriteViewModelProtocol viewModel;

  const FavoriteView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesDB - Favorites'),
      ),
      backgroundColor: Colors.blueGrey,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.isEmpty) {
            return const Center(
              child: Text(
                'Lista de Favoritos vazia!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.getMovie(),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 4,
                      mainAxisExtent: MediaQuery.of(context).size.width / 3,
                      mainAxisSpacing: 8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        return InkWell(
                          onTap: () => viewModel.didTap(index),
                          child: CardMovie(
                            path: viewModel.imagePath(index),
                          ),
                        );
                      },
                      childCount: viewModel.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
