import 'package:movies/features/upcoming/upcoming/upcoming_view_controller.dart';
import 'package:movies/features/upcoming/use_case/upcoming_use_case.dart';
import 'package:movies/support/utils/constants.dart';

import '../../../models/movie.dart';

class UpcomingViewModel extends UpcomingProtocol {
  bool loading = false;
  List<Movie> _movies = [];
  int _selectedIndex = 0;
  final UpcomingUseCaseProtocol useCase;

  UpcomingViewModel({required this.useCase});

  @override
  bool get isLoading => loading;

  @override
  int get length => _movies.length;

  @override
  int get index => _selectedIndex;

  @override
  void setIndex(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  @override
  String title(int index) {
    return _movies[index].title;
  }

  @override
  String imagePath(int index) {
    return Constants.urlImagePath + _movies[index].imagePath;
  }

  @override
  void getUpcoming() {
    setLoading(true);
    useCase.execute(
      success: (movies) {
        _movies = movies;

        setLoading(false);
      },
      failure: (error) {
        setLoading(false);
        print(error.description);
      },
    );
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
