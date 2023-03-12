import 'package:flutter/material.dart';
import 'splash_screen/splash_screen_view_model.dart';
import 'splash_screen/splash_screen_view_controller.dart';

class SplashScreenFactory {
  static const String route = 'splash_screen';

  static StatefulWidget splashScreen() {
    final viewModel = SplashScreenViewModel();

    return SplashScreenController(viewModel: viewModel);
  }
}
