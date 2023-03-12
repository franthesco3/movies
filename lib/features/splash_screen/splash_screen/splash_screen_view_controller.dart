import '../../home/home_factory.dart';
import 'splash_screen_view.dart';
import 'package:flutter/material.dart';

abstract class SplashScreenProtocol extends SplashScreenViewModelProtocol {
  void Function()? goToScreen;
}

class SplashScreenController extends StatefulWidget {
  final SplashScreenProtocol viewModel;

  const SplashScreenController({super.key, required this.viewModel});

  @override
  State<SplashScreenController> createState() => _SplashScreenControllerState();
}

class _SplashScreenControllerState extends State<SplashScreenController> {
  @override
  void initState() {
    _bind();
    widget.viewModel.gotToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.goToScreen = () {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeFactory.route, (route) => false);
      });
    };
  }
}
