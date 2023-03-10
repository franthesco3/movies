import 'package:flutter/material.dart';
import '../../../support/components/card.dart';

abstract class PopularViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isEmpty;
  bool get isLoading;

  void getPopular();
  void didTap(int index);
  String title(int index);
  void setIndex(int index);
  String imagePath(int index);
}

class PopularView extends StatelessWidget {
  final PopularViewModelProtocol viewModel;

  const PopularView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesDB - Popular'),
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
                child: Text('Nâo foi possivel carregar os dados!'));
          }

          return CustomScrollView(
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
          );
        },
      ),
    );
  }
}
