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

class ListEmployeesBloc extends BaseBloc {
  final IEmployeeRepo _employeeRepo;

  final StreamController<List<EmployeeModel>> _loadedEmployeesController =
      StreamController.broadcast();

  final List<EmployeeModel> _loadedEmployees = [];
  PaginationModel? _loadingPage;

  ListEmployeesBloc(AppRouter appRouter, this._employeeRepo) : super(appRouter);

  Stream<List<EmployeeGroupModel>> get employeeGroupStream =>
      _loadedEmployeesController.stream.map(_mapEmployeeList);

  bool get hasMore => true;

  Future<PaginationModel?> loadData(PaginationModel loadPage) async {
    if (_loadingPage == null || _loadingPage != loadPage) {
      _loadingPage = loadPage;
      EmployeeListModel employeeListModel = await _fetchData(loadPage);
      _loadedEmployees.addAll(employeeListModel.employees);
      _loadedEmployeesController.add(_loadedEmployees);
      _loadingPage = null;
      return employeeListModel.paginationModel;
    }
    return null;
  }

  Future<EmployeeListModel> _fetchData(PaginationModel loadPage) async {
    EmployeeListModel employeeListModel = await _employeeRepo.getList(loadPage);
    return employeeListModel;
  }

  List<EmployeeGroupModel> _mapEmployeeList(List<EmployeeModel> employees) {
    Map<String, List<EmployeeModel>> groupedData =
        groupBy(employees, (EmployeeModel e) => e.firstName.characters.first);
    return groupedData.keys
        .map<EmployeeGroupModel>(
            (String key) => EmployeeGroupModel(key, groupedData[key]!))
        .toList();
  }

  void onTapEmployee(EmployeeModel employeeModel) {}

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _loadedEmployeesController.close();
  }
}
