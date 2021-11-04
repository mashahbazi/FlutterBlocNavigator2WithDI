import 'package:casestudy/common/models/employee_list_model.dart';
import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/common/models/pagination_model.dart';
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
  Future<EmployeeListModel> getList(PaginationModel paginationModel) async {
    try {
      int offset = (paginationModel.page - 1) * paginationModel.itemPerPage;
      List<EmployeeModel> employees = await _employeeDao.getList(
          limit: paginationModel.itemPerPage, offset: offset);
      return EmployeeListModel(
          employees, paginationModel.copyWith(page: paginationModel.page + 1));
    } on Exception catch (e) {
      throw DataException(DataExceptionCodes.getListEmployees, e.toString());
    }
  }
}
