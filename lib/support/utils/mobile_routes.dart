import 'package:flutter/material.dart';
import 'package:movies/features/upcoming/upcoming_factory.dart';

class MobileRoutes {
  static String initialRoutes = UpcomingFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    UpcomingFactory.route: (context) {
      return UpcomingFactory.home();
    }
  };
}
