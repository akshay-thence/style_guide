// ignore_for_file: annotate_overrides, overridden_fields

abstract class AppException {
  final String code;
  final String message;
  AppException({
    this.code = '',
    this.message = '',
  });

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException({
    this.code = '',
    this.message = '',
  }) : super(code: code, message: message);

  final String code;
  final String message;
}

class DataParsingException extends AppException {
  DataParsingException({
    this.code = '',
    this.message = 'An unexpected error has occurred',
  }) : super(code: code, message: message);

  final String code;
  final String message;
}

class NoConnectionException extends AppException {
  NoConnectionException({
    this.code = '',
    this.message = '',
  }) : super(code: code, message: message);

  final String code;
  final String message;
}

class ErrorResponseException extends AppException {
  ErrorResponseException({
    this.code = '',
    this.message = 'An unexpected error has occurred',
  }) : super(code: code, message: message);

  final String code;
  final String message;
}

class OperationCanceledException extends AppException {
  OperationCanceledException({
    this.code = '',
    this.message = 'OperationCanceledException',
    this.data,
  }) : super(code: code, message: message);

  final String code;
  final String message;
  final dynamic data;
}
