import '../../../models/movie.dart';
import 'package:movies/support/utils/constants.dart';
import 'package:movies/features/upcoming/use_case/upcoming_use_case.dart';
import 'package:movies/features/upcoming/upcoming/upcoming_view_controller.dart';

class UpcomingViewModel extends UpcomingProtocol {
  int _page = 1;
  bool _isLoading = false;
  int _selectedIndex = 0;
  List<Movie> _movies = [];
  final UpcomingUseCaseProtocol useCase;

  UpcomingViewModel({required this.useCase});

  @override
  bool get isLoading => _isLoading;

  @override
  int get length => _movies.length;

  @override
  int get index => _selectedIndex;

  @override
  int get page => _page;

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
  void didTap(int index) {
    onTapGoToDetails?.call(_movies[index]);
  }

  @override
  bool get isEmpty => _movies.isEmpty;

  @override
  void moreRequest(int page) {
    _page = page;
    getUpcoming(page);

    notifyListeners();
  }

  @override
  void getUpcoming(int? page) {
    setLoading(true);
    useCase.execute(
      page: _page.toString(),
      success: (movies) {
        _movies.addAll(movies);

        setLoading(false);
      },
      failure: (error) {
        setLoading(false);
        onFailureGetUpcoming?.call();
      },
    );
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
