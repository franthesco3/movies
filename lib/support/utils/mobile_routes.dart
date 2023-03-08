import '../../models/movie.dart';
import 'package:flutter/material.dart';
import '../../features/favorite/favorites_factory.dart';
import 'package:movies/features/home/home_factory.dart';
import 'package:movies/features/search/search_factory.dart';
import 'package:movies/features/popular/popular_factory.dart';
import 'package:movies/features/details/details_factory.dart';
import 'package:movies/features/upcoming/upcoming_factory.dart';

class MobileRoutes {
  static String initialRoutes = HomeFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    UpcomingFactory.route: (_) {
      return UpcomingFactory.home();
    },
    FavoriteFactory.route: (_) {
      return FavoriteFactory.favorite();
    },
    PopularFactory.route: (_) {
      return PopularFactory.popular();
    },
    HomeFactory.route: (_) {
      return HomeFactory.home();
    },
    SearchFactory.route: (_) {
      return SearchFactory.search();
    },
    DetailsFactory.route: (context) {
      final movie = ModalRoute.of(context)?.settings.arguments as Movie;

      return DetailsFactory.details(movie);
    },
  };
}
