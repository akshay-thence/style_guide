import 'dart:developer' as developer;

class AppLogger {
  static String _getTag(String? tag) {
    return (tag?.isEmpty ?? true) ? '' : '$tag: ';
  }

  /// Info
  static i(String msg, {String tag = ''}) {
    developer.log('\x1B[34m${_getTag(tag)}$msg\x1B[0m');
  }

  /// Success
  static s(String msg, {String tag = ''}) {
    developer.log('\x1B[32m${_getTag(tag)}$msg\x1B[0m');
  }

  /// Warning
  static w(String msg, {String tag = ''}) {
    developer.log('\x1B[33m${_getTag(tag)}$msg\x1B[0m');
  }

  /// Error
  static e(String msg, {String tag = ''}) {
    developer.log('\x1B[31m${_getTag(tag)}$msg\x1B[0m');
  }
}
