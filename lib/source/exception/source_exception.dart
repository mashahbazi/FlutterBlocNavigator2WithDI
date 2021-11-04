class SourceException implements Exception {
  final int code;
  final String? message;

  SourceException(this.code, [this.message]);
}

class SourceExceptionCode {
  static const int errorLoadData = 1;
}
