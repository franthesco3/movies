import 'package:movies/features/home/home/home_view_controller.dart';

class HomeViewModel extends HomeProtocol {
  int _index = 0;

  @override
  int get index => _index;

  @override
  void setIndex(int index) {
    _index = index;

    notifyListeners();
  }
}
