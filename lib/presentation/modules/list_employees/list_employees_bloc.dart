import 'package:casestudy/common/models/employee_group_model.dart';
import "package:collection/collection.dart";
import 'dart:async';

import 'package:casestudy/common/models/employee_list_model.dart';
import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/domain/repo/employee_repo_interface.dart';
import 'package:casestudy/presentation/modules/core/base_bloc.dart';
import 'package:casestudy/presentation/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';

class ListEmployeesBloc extends BaseBloc {
  final IEmployeeRepo _employeeRepo;

  final BehaviorSubject<List<EmployeeModel>?> _loadedEmployeesController =
      BehaviorSubject();
  final BehaviorSubject<String> _visibleCharController =
      BehaviorSubject.seeded("");

  String? _loadingEmployeeName;

  ListEmployeesBloc(AppRouter appRouter, this._employeeRepo)
      : super(appRouter) {
    loadData();
  }

  Stream<List<EmployeeGroupModel>?> get employeeGroupStream =>
      _loadedEmployeesController.stream.map(_mapEmployeeList);

  bool get hasMore => true;

  Stream<String> get charStream => _visibleCharController.stream;

  List<EmployeeModel> get _loadedEmployees =>
      _loadedEmployeesController.hasValue
          ? _loadedEmployeesController.value!
          : [];

  Future<void> loadData() async {
    String? employeeName = _loadedEmployees.lastOrNull?.firstName;
    if (_loadingEmployeeName == null || _loadingEmployeeName != employeeName) {
      _loadingEmployeeName = employeeName;
      EmployeeListModel employeeListModel = await _fetchData(employeeName);
      List<EmployeeModel> loadedEmployees = _loadedEmployees;
      loadedEmployees.addAll(employeeListModel.employees);
      _loadedEmployeesController.add(loadedEmployees);
      _loadingEmployeeName = null;
    }
  }

  Future<EmployeeListModel> _fetchData(String? employeeFirsName) async {
    EmployeeListModel employeeListModel =
        await _employeeRepo.getNextEmployees(employeeFirsName);
    return employeeListModel;
  }

  List<EmployeeGroupModel>? _mapEmployeeList(List<EmployeeModel>? employees) {
    if (employees != null) {
      Map<String, List<EmployeeModel>> groupedData =
          groupBy(employees, (EmployeeModel e) => e.firstName.characters.first);
      return groupedData.keys
          .map<EmployeeGroupModel>(
              (String key) => EmployeeGroupModel(key, groupedData[key]!))
          .toList();
    }
  }

  void onTapEmployee(EmployeeModel employeeModel) {}

  void charGroupGetVisible(String char) {
    if (char != _visibleCharController.value) {
      _visibleCharController.add(char);
    }
  }

  Future<void> onSelectChar(String char) async {
    List<EmployeeModel> loadedEmployees = _loadedEmployees;

    if (char.compareTo(_loadedEmployees.lastOrNull?.firstName ?? "") > 0) {
      EmployeeListModel beforeChar =
          await _employeeRepo.getAllEmployeesBefore(char);
      EmployeeListModel afterChar =
          await _employeeRepo.getAllEmployeesBefore(char);

      loadedEmployees.addAll(beforeChar.employees);
      loadedEmployees.addAll(afterChar.employees);
      loadedEmployees = loadedEmployees.toSet().toList();

      _loadedEmployeesController.add(loadedEmployees);
    }
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _loadedEmployeesController.close();
    _visibleCharController.close();
  }
}
