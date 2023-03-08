import '../../../models/movie.dart';
import 'package:movies/api/routes/search_routes.dart';

typedef Failure = void Function(String error);
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
          failure?.call(error.stackTrace.toString());
        }
      },
      failure: (error) {
        failure?.call(error.message);
      },
    );
  }
}
