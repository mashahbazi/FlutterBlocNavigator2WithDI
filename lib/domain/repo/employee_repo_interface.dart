import 'package:casestudy/common/models/employee_list_model.dart';
import 'package:casestudy/common/models/pagination_model.dart';

abstract class IEmployeeRepo {
  Future<void> loadData();

  Future<EmployeeListModel> getList(PaginationModel paginationModel);
}
