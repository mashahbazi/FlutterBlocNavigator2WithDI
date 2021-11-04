import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/data/api/employee_source_interface.dart';
import 'package:casestudy/data/dao/employee_dao_interface.dart';
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
    } catch (e) {
     // TODO: handle me
    }
  }
}
