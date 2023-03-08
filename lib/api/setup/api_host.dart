import '../../support/utils/constants.dart';

class ApiHost {
  static String get baseURL {
    return 'https://api.themoviedb.org/3';
  }

  static Map<String, dynamic> get sessionHeaders {
    const accessToken = 'Bearer ${Constants.apiKey}';

    return <String, dynamic>{'Authorization': accessToken};
  }
}
