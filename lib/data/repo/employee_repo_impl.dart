import 'package:casestudy/common/models/employee_list_model.dart';
import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/data/api/employee_source_interface.dart';
import 'package:casestudy/data/dao/employee_dao_interface.dart';
import 'package:casestudy/data/expection/data_exception.dart';
import 'package:casestudy/database/exception/database_exception.dart';
import 'package:casestudy/domain/repo/employee_repo_interface.dart';

class EmployeeRepoImpl implements IEmployeeRepo {
  final IEmployeeSource _employeeSource;
  final IEmployeeDao _employeeDao;

  EmployeeRepoImpl(this._employeeSource, this._employeeDao);

  @override
  Future<void> loadData() async {
    try {
      List<EmployeeModel> employees = await _employeeSource.loadData();
      await _employeeDao.insertAllData(employees);
    } on Exception catch (e) {
      throw DatabaseException(
          DatabaseExceptionCodes.insertEmployees, e.toString());
    }
  }

  @override
  Future<EmployeeListModel> getNextEmployees(String? employeeName) async {
    try {
      List<EmployeeModel> employees =
          await _employeeDao.getNextEmployees(employeeName);
      return EmployeeListModel(employees, employees.last.firstName);
    } on Exception catch (e) {
      throw DataException(DataExceptionCodes.getListEmployees, e.toString());
    }
  }

  @override
  Future<EmployeeListModel> getAllEmployeesBefore(String employeeName) async {
    try {
      List<EmployeeModel> employees =
          await _employeeDao.getAllEmployeesBefore(employeeName);
      return EmployeeListModel(employees, employees.last.firstName);
    } on Exception catch (e) {
      throw DataException(DataExceptionCodes.getListEmployees, e.toString());
    }
  }

  @override
  Future<EmployeeModel> get(int id) async {
    try {
      EmployeeModel employee = await _employeeDao.get(id);
      return employee;
    } on Exception catch (e) {
      throw DataException(DataExceptionCodes.getEmployee, e.toString());
    }
  }
}
