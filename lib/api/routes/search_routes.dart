import '../../support/utils/constants.dart';
import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class SearchRoutesProtocol {
  void search({required String query, Success? success, Failure? failure});
}

class SearchRoutes extends SearchRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void search({required String query, Success? success, Failure? failure}) {
    final queryParameters = {
      'query': query,
      'api_key': Constants.apiKey,
    };

    final endpoint = Endpoint(
      path: '/search/movie',
      method: Method.get,
      queryParameters: queryParameters,
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
