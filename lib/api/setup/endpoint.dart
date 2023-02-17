enum Method { get, put, post, patch, delete }

class Endpoint {
  dynamic data;
  String path;
  Method method;
  String? contentType;
  Map<String, String>? queryParameters;

  Endpoint({
    this.data,
    this.contentType,
    this.queryParameters,
    required this.path,
    required this.method,
  });
}
