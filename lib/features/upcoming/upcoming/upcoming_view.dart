import 'package:flutter/material.dart';

import '../../../support/components/card.dart';

abstract class UpcomingViewModelProtocol extends ChangeNotifier {
  int get index;
  int get length;
  bool get isLoading;

  String title(int index);
  void setIndex(int index);
  String imagePath(int index);
}

class UpcomingView extends StatelessWidget {
  final UpcomingViewModelProtocol viewModel;

  const UpcomingView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: AnimatedBuilder(
          animation: viewModel,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Upcoming',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.stars),
                  label: 'Popular',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
              ],
              selectedItemColor: Colors.white,
              currentIndex: viewModel.index,
              onTap: viewModel.setIndex,
            );
          }),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                title: Text('MovieDb'),
              ),
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
                      return CardMovie(
                        path: viewModel.imagePath(index),
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
