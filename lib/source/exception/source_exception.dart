class SourceException implements Exception {
  final int code;
  final String? message;

  SourceException(this.code, [this.message]);

  @override
  String toString() {
    return '''Source Exception
    code"$code
    message:$message
    ''';
  }
}

class SourceExceptionCode {
  static const int errorLoadData = 1;
}
