import 'dart:convert';

import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/data/api/employee_source_interface.dart';
import 'package:casestudy/source/exception/source_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class EmployeeSourceImpl implements IEmployeeSource {
  @override
  Future<List<EmployeeModel>> loadData() async {
    try {
      String str = await rootBundle.loadString("assets/employees.json");
      List<dynamic> listJson = await compute(processInBackground, str);
      return listJson
          .map((dynamic item) => EmployeeModel.fromJson(Map.from(item)))
          .toList();
    } catch (e) {
      throw SourceException(SourceExceptionCode.errorLoadData, e.toString());
    }
  }
}

List<dynamic> processInBackground(dynamic str) {
  return List.from(jsonDecode(str));
}
