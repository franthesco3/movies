import 'package:movies/api/routes/search_routes.dart';
import 'package:movies/models/server_error.dart';

import '../../../models/movie.dart';

typedef Failure = void Function(ServerError error);
typedef Success = void Function(List<Movie> movies);

abstract class SearchUseCaseProtocol {
  void execute({required String query, Success? success, Failure? failure});
}

class SearchUseCase extends SearchUseCaseProtocol {
  final SearchRoutesProtocol routes;

  SearchUseCase({required this.routes});

  @override
  void execute({required String query, Success? success, Failure? failure}) {
    routes.search(
      query: query,
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
