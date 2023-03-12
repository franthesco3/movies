import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:movies/support/utils/constants.dart';

abstract class SplashScreenViewModelProtocol {
  void gotToHome();
}

class SplashScreen extends StatelessWidget {
  final SplashScreenViewModelProtocol viewModel;

  const SplashScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Constants.movie),
          ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.amber,
                BlendMode.modulate,
              ),
              child: Lottie.asset(Constants.moviesTitle)),
        ],
      ),
    );
  }
}
