import '../setup/endpoint.dart';
import '../setup/api_provider.dart';
import '../../support/utils/constants.dart';

abstract class PopularRoutesProtocol {
  void getPopular({Success? success, Failure? failure});
}

class PopularRoutes extends PopularRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getPopular({Success? success, Failure? failure}) {
    final queryParameters = {'api_key': Constants.apiKey};

    final endpoint = Endpoint(
      path: '/movie/popular',
      method: Method.get,
      queryParameters: queryParameters,
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
