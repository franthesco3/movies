import 'package:movies/models/movie.dart';
import 'package:movies/api/routes/upcoming_routes.dart';

typedef Failure = void Function(String error);
typedef Success = void Function(List<Movie> movies);

abstract class UpcomingUseCaseProtocol {
  void execute({required String page, Success? success, Failure? failure});
}

class UpcomingUseCase extends UpcomingUseCaseProtocol {
  final UpcomingRoutesProtocol routes;

  UpcomingUseCase({required this.routes});

  @override
  void execute({required String page, Success? success, Failure? failure}) {
    routes.getUpcoming(
      page: page,
      success: (result) {
        try {
          final movies = List<Movie>.from(
              result['results'].map((movie) => Movie.fromMap(movie)));
          success?.call(movies);
        } on Error catch (error) {
          failure?.call(error.stackTrace.toString());
        }
      },
      failure: (error) {
        failure?.call(error.message);
      },
    );
  }
}
