import 'package:casestudy/common/models/employee_group_model.dart';
import "package:collection/collection.dart";
import 'dart:async';

import 'package:casestudy/common/models/employee_list_model.dart';
import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/common/models/pagination_model.dart';
import 'package:casestudy/domain/repo/employee_repo_interface.dart';
import 'package:casestudy/presentation/modules/core/base_bloc.dart';
import 'package:casestudy/presentation/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';

class ListEmployeesBloc extends BaseBloc {
  final IEmployeeRepo _employeeRepo;

  final BehaviorSubject<List<EmployeeModel>?> _loadedEmployeesController =
      BehaviorSubject();
  final BehaviorSubject<String> _visibleCharController = BehaviorSubject();

  PaginationModel? _loadingPage;

  ListEmployeesBloc(AppRouter appRouter, this._employeeRepo) : super(appRouter);

  Stream<List<EmployeeGroupModel>?> get employeeGroupStream =>
      _loadedEmployeesController.stream.map(_mapEmployeeList);

  bool get hasMore => true;

  Stream<String> get charStream => _visibleCharController.stream;

  Future<PaginationModel?> loadData(PaginationModel loadPage) async {
    if (_loadingPage == null || _loadingPage != loadPage) {
      _loadingPage = loadPage;
      EmployeeListModel employeeListModel = await _fetchData(loadPage);
      List<EmployeeModel> loadedEmployees = _loadedEmployeesController.hasValue
          ? _loadedEmployeesController.value!
          : [];
      loadedEmployees.addAll(employeeListModel.employees);
      _loadedEmployeesController.add(loadedEmployees);
      _loadingPage = null;
      return employeeListModel.paginationModel;
    }
    return null;
  }

  Future<EmployeeListModel> _fetchData(PaginationModel loadPage) async {
    EmployeeListModel employeeListModel = await _employeeRepo.getList(loadPage);
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
    _visibleCharController.add(char);
  }

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _loadedEmployeesController.close();
    _visibleCharController.close();
  }
}
