import 'package:movies/features/popular/popular/popular_view_controller.dart';
import 'package:movies/features/popular/use_case/popular_use_case.dart';

import '../../../models/movie.dart';
import '../../../support/utils/constants.dart';

class PopularViewModel extends PopularProtocol {
  bool _isLoading = false;
  final List<Movie> _movies = [];
  final PopularUseCaseProtocol useCase;

  PopularViewModel({required this.useCase});

  @override
  void didTap(int index) {
    onTapGoToDetails?.call(_movies[index]);
  }

  @override
  bool get isLoading => _isLoading;

  @override
  int get length => _movies.length;
  @override
  void setIndex(int index) {}

  @override
  String title(int index) {
    return _movies[index].title;
  }

  @override
  bool get isEmpty => _movies.isEmpty;

  @override
  String imagePath(int index) {
    return Constants.urlImagePath + _movies[index].imagePath;
  }

  @override
  void getPopular() {
    setLoading(true);
    useCase.execute(
      success: (movies) {
        _movies.addAll(movies);
        setLoading(false);
      },
      failure: (error) {
        setLoading(false);
        print(error);
      },
    );
  }

  void setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }
}
