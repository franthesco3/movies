import 'package:flutter/material.dart';
import 'package:movies/features/home/home/home_view_model.dart';
import 'package:movies/features/home/home/home_view_controller.dart';

class HomeFactory {
  static String route = '/home';

  static StatefulWidget home() {
    final viewModel = HomeViewModel();

    return HomeViewController(viewModel: viewModel);
  }
}
