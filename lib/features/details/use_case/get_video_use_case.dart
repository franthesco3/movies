import '../../../api/routes/get_video.dart';
import '../../../models/video.dart';

typedef Success = void Function(Video video);
typedef Failure = void Function(String? error);

abstract class GetVideoUseCaseProtocol {
  void execute({required int movieId, Success? success, Failure? failure});
}

class GetVideoUseCase extends GetVideoUseCaseProtocol {
  final GetVideoRoutesProtocol routes;

  GetVideoUseCase({required this.routes});

  @override
  void execute({required int movieId, Success? success, Failure? failure}) {
    routes.getVideo(
      movieId: movieId,
      success: (result) {
        try {
          final video = Video.fromMap(result['results'][0]);
          success?.call(video);
        } on Error catch (error) {
          failure?.call(error.toString());
        }
      },
      failure: (error) {
        failure?.call(error.message);
      },
    );
  }
}
