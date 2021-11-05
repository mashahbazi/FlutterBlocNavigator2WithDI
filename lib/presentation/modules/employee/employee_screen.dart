import 'package:casestudy/presentation/modules/core/base_screen.dart';
import 'package:casestudy/presentation/modules/employee/employee_bloc.dart';
import 'package:flutter/widgets.dart';

class EmployeeScreen extends BaseScreen {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState
    extends BaseScreenState<EmployeeScreen, EmployeeBloc> {
  @override
  Widget buildBody() {
    // TODO: implement buildBody
    throw UnimplementedError();
  }
}
