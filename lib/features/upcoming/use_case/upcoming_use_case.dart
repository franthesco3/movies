import 'package:movies/api/routes/upcoming_routes.dart';
import 'package:movies/models/movie.dart';

import '../../../models/server_error.dart';

typedef Failure = void Function(ServerError error);
typedef Success = void Function(List<Movie> movies);

abstract class UpcomingUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class UpcomingUseCase extends UpcomingUseCaseProtocol {
  final UpcomingRoutesProtocol routes;

  UpcomingUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getUpcoming(
      success: (result) {
        try {
          final movies = List<Movie>.from(
              result['results'].map((movie) => Movie.fromMap(movie)));
          success?.call(movies);
        } on Error catch (error) {
          failure?.call(error.asInternalError());
        }
      },
      failure: (error) {
        failure?.call(error.asServerError());
      },
    );
  }
}
