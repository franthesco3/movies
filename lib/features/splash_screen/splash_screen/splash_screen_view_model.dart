import 'package:movies/features/splash_screen/splash_screen/splash_screen_view_controller.dart';

class SplashScreenViewModel extends SplashScreenProtocol {
  @override
  void gotToHome() {
    goToScreen?.call();
  }
}
