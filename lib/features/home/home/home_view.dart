import 'package:flutter/material.dart';
import 'package:movies/features/search/search_factory.dart';
import 'package:movies/features/popular/popular_factory.dart';
import '../../../support/components/bottom_navigation_bar.dart';
import 'package:movies/features/favorite/favorites_factory.dart';
import 'package:movies/features/upcoming/upcoming_factory.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  int get index;
  void setIndex(int index);
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  HomeView({super.key, required this.viewModel});

  final contents = <Widget>[
    UpcomingFactory.home(),
    PopularFactory.popular(),
    SearchFactory.search(),
    FavoriteFactory.favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, snapshot) {
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            index: viewModel.index,
            onTap: viewModel.setIndex,
          ),
          body: contents.elementAt(viewModel.index),
        );
      },
    );
  }
}
