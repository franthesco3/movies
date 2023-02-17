import '../../support/utils/constants.dart';

class ApiHost {
  static String get versionPath => 'v3';

  static String get baseURL {
    return 'https://api.themoviedb.org/3/movie';
  }

  static Future<Map<String, dynamic>> get sessionHeaders async {
    final accessToken = 'Bearer ${Constants.apiKey}';

    return <String, dynamic>{'Authorization': accessToken};
  }
}
