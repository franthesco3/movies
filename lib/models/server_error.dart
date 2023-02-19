import 'package:dio/dio.dart';

class ServerError {
  final String? _error;
  final int? _statusCode;
  final bool? _isSubscriptionActive;
  final List<String>? _errors;

  ServerError(
      {String? error,
      int? statusCode,
      List<String>? errors,
      bool? isSubscriptionActive})
      : _error = error,
        _errors = errors,
        _statusCode = statusCode,
        _isSubscriptionActive = isSubscriptionActive;

  ServerError.fromMap(Map<String, dynamic> map)
      : _error = map['error'],
        _statusCode = map['statusCode'],
        _isSubscriptionActive = map['isSubscriptionActive'],
        _errors = List<String>.from(
            map['errors']?.map((error) => error as String) ?? []);

  String get description {
    return _error ?? _errors?.join(', ') ?? 'Error na requisição';
  }

  int get statusCode {
    return _statusCode ?? 0;
  }

  bool get isSubscriptionActive {
    return _isSubscriptionActive!;
  }
}

extension DioErrorExtension on DioError {
  ServerError asServerError() {
    try {
      final serverError = ServerError.fromMap({
        'error': response!.data['message'],
        'statusCode': response!.statusCode,
      });
      return serverError;
    } on TypeError catch (error) {
      return error.asInternalError();
    } on Error catch (error) {
      return error.mapToServerError();
    }
  }
}

extension ErrorExtension on Error {
  ServerError asInternalError() {
    if (this is TypeError)
      return ServerError(error: 'Um erro inesperado aconteceu!');

    return ServerError(
        error: 'Erro na requisicao, um problema inesperado aconteceu');
  }

  ServerError mapToServerError() {
    final error = this as DioError;

    if (error.type == DioErrorType.connectTimeout) {
      return ServerError(
          error: 'Tempo de requisição atingida, tente novamente mais tarde');
    }

    return ServerError(error: 'Um erro inesperado aconteceu');
  }
}
