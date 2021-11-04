import 'package:flutter/cupertino.dart';

import '../../tempo_db.dart';

class BaseDao {
  @protected
  final TempoDB tempoDB;

  BaseDao(this.tempoDB);
}
