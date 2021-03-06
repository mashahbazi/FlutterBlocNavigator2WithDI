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
  static const int getListEmployees = 2;
  static const int getEmployee = 3;
  static const int getLength = 4;
}
