import 'package:flutter/material.dart';
import 'package:movies/features/details/details_factory.dart';
import 'package:movies/features/upcoming/upcoming_factory.dart';

import '../../features/favorite/favorites_factory.dart';
import '../../models/movie.dart';

class MobileRoutes {
  static String initialRoutes = UpcomingFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    UpcomingFactory.route: (_) {
      return UpcomingFactory.home();
    },
    DetailsFactory.route: (context) {
      final movie = ModalRoute.of(context)?.settings.arguments as Movie;
      return DetailsFactory.details(movie);
    },
    FavoriteFactory.route: (_) {
      return FavoriteFactory.favorite();
    }
  };
}
