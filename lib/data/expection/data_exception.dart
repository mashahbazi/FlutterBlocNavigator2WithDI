class DataException implements Exception {
  final int code;
  final String? message;

  DataException(this.code, [this.message]);

  @override
  String toString() {
    return '''Data Exception
    code"$code
    message:$message
    ''';
  }
}

class DataExceptionCodes {
  static const int loadData = 1;
}
