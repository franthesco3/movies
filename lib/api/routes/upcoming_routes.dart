import '../setup/endpoint.dart';
import '../setup/api_provider.dart';
import 'package:movies/support/utils/constants.dart';

abstract class UpcomingRoutesProtocol {
  void getUpcoming({required String page, Success? success, Failure? failure});
}

class UpcomingRoutes extends UpcomingRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getUpcoming({required String page, Success? success, Failure? failure}) {
    final queryParameters = {
      'api_key': Constants.apiKey,
      'page': page,
    };

    final endpoint = Endpoint(
      path: '/movie/upcoming',
      method: Method.get,
      queryParameters: queryParameters,
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
