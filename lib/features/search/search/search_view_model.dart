import 'package:movies/features/search/search/search_view_controller.dart';
import 'package:movies/features/search/use_case/search_use_case.dart';
import 'package:movies/support/utils/constants.dart';

import '../../../models/movie.dart';

class SearchViewModel extends SearchProtocol {
  String _query = '';
  bool _isLoading = false;
  final List<Movie> _movies = [];
  final SearchUseCaseProtocol useCase;

  SearchViewModel({required this.useCase});

  @override
  bool get isLoading => _isLoading;

  @override
  int get length => _movies.length;

  @override
  String imagePath(int index) {
    return Constants.urlImagePath + _movies[index].imagePath;
  }

  @override
  void onChange(String value) {
    _query = value;

    notifyListeners();
  }

  @override
  void didTap(int index) {
    onTapGoToDetails?.call(_movies[index]);
  }

  @override
  bool get isEmpty => _movies.isEmpty;

  @override
  void searchMovies(String query) {
    _setLoading(true);
    useCase.execute(
      query: query,
      success: (movies) {
        _movies.addAll(movies);
        _setLoading(false);
      },
      failure: (error) {
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  @override
  void getSearchQuery() {
    _movies.clear();
    getQuery?.call(_query);
  }
}
