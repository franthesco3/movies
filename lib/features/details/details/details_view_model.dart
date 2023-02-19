import 'package:movies/features/details/details/details_view_controller.dart';
import 'package:movies/support/utils/constants.dart';

import '../../../models/movie.dart';
import '../../../models/video.dart';
import '../use_case/get_video_use_case.dart';

class DetailsViewModel extends DetailsProtocol {
  bool _isLoading = false;
  final Movie movie;
  late Video _video;

  final GetVideoUseCaseProtocol useCase;

  DetailsViewModel({required this.useCase, required this.movie});

  @override
  String get title => movie.title;

  @override
  bool get isLoading => _isLoading;

  @override
  String get overview => movie.overview;

  @override
  String get vote => movie.voteAverage.toString();

  @override
  bool get isFavorited => movie.isFavorite;

  @override
  String get imagePath => Constants.urlImagePath + movie.imagePath;

  @override
  String get key => _video.key;

  @override
  void setFavorite() {
    movie.isFavorite = !movie.isFavorite;

    notifyListeners();
  }

  @override
  void getVideo() {
    setLoading(true);
    useCase.execute(
      movieId: movie.id,
      success: (video) {
        _video = video;

        setLoading(false);
      },
      failure: (error) {
        print(error);

        setLoading(false);
      },
    );
  }

  void setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }
}
