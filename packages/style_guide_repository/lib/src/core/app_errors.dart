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

class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}
