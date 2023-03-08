import 'package:hive/hive.dart';
import '../../../models/movie.dart';
import '../../../models/video.dart';
import '../use_case/get_video_use_case.dart';
import 'package:movies/support/utils/constants.dart';
import 'package:movies/features/details/details/details_view_controller.dart';

class DetailsViewModel extends DetailsProtocol {
  late Box _box;
  final Movie movie;
  late Video _video;
  bool _isFavorite = false;
  bool _isLoading = false;

  final GetVideoUseCaseProtocol useCase;

  DetailsViewModel({required this.useCase, required this.movie});

  @override
  String? get key => _video.key;

  @override
  String get title => movie.title;

  @override
  bool get isLoading => _isLoading;

  @override
  String get overview => movie.overview;

  @override
  bool get isFavorited => _isFavorite;

  @override
  String get vote => movie.voteAverage.toString();

  @override
  String get imagePath => Constants.urlImagePath + movie.imagePath;

  @override
  void setFavorite() async {
    if (_isFavorite) {
      _remove(movie);
      _isFavorite = false;
      removeMovie?.call();
    } else {
      _saveMovie(movie);
      _isFavorite = true;
      addMovie?.call();
    }
    notifyListeners();
  }

  @override
  void getVideo() async {
    _setLoading(true);
    _verifyFavorite();
    useCase.execute(
      movieId: movie.id,
      success: (video) {
        _video = video;

        _setLoading(false);
      },
      failure: (error) {
        print(error);

        _setLoading(false);
      },
    );
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  void _saveMovie(Movie movie) async {
    _box = await Hive.openBox<Movie>('movies');

    _box.put(movie.id, movie);

    notifyListeners();
  }

  void _remove(Movie movie) async {
    _box = await Hive.openBox<Movie>('movies');
    _box.delete(movie.id);

    notifyListeners();
  }

  void _changeFavorite(bool value) {
    _isFavorite = value;

    notifyListeners();
  }

  void _verifyFavorite() async {
    _box = await Hive.openBox<Movie>('movies');
    if (_box.containsKey(movie.id)) _changeFavorite(true);
  }
}
