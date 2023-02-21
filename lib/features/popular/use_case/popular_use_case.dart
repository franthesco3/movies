import '../../../api/routes/popular_routes.dart';
import '../../../models/movie.dart';
import '../../../models/server_error.dart';

typedef Failure = void Function(ServerError error);
typedef Success = void Function(List<Movie> movies);

abstract class PopularUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class PopularUseCase extends PopularUseCaseProtocol {
  final PopularRoutesProtocol routes;

  PopularUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure}) {
    routes.getPopular(
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
