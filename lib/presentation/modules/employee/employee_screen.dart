import 'package:casestudy/common/models/employee_model.dart';
import 'package:casestudy/presentation/modules/core/base_screen.dart';
import 'package:casestudy/presentation/modules/employee/employee_bloc.dart';
import 'package:casestudy/presentation/modules/employee/information_row_widget.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:casestudy/presentation/utils/extensions/context_extensions.dart';
import 'package:casestudy/presentation/widget/stream_builder_with_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_border/dotted_border.dart';

class EmployeeScreen extends BaseScreen {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState
    extends BaseScreenState<EmployeeScreen, EmployeeBloc> {
  @override
  PreferredSizeWidget? buildAppBar() => null;

  @override
  Widget buildBody() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildSliverBody(),
      ],
    );
  }

  Widget _buildSliverAppBar() {
    double imageHeight = context.getHeightFraction(0.28);
    return SliverAppBar(
      backgroundColor: backgroundColor,
      expandedHeight: context.getHeightFraction(0.55),
      elevation: 0,
      pinned: true,
      actions: const [
        Icon(
          Icons.more_vert,
          color: AppColors.black,
        ),
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _buildTitleSection(imageHeight),
              _buildImage(imageHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverBody() {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          _buildBasicInformationTitle(),
          _buildBasicInformation(),
        ],
      ),
    );
  }

  Widget _buildImage(double imageHeight) {
    return StreamBuilderWithLoading(
        stream: bloc.employeeSteam,
        builder: (EmployeeModel employeeModel) {
          return SizedBox.square(
            dimension: imageHeight,
            child: Padding(
              padding: EdgeInsets.all(context.getWidthFraction(0.03)),
              child: CircleAvatar(
                backgroundImage: NetworkImage(employeeModel.imageUrl),
                radius: imageHeight / 2,
              ),
            ),
          );
        });
  }

  Widget _buildTitleSection(double imageHeight) {
    double sideMargin = context.getWidthFraction(0.06);
    return Container(
      margin: EdgeInsets.only(
          top: imageHeight / 2, right: sideMargin, left: sideMargin),
      color: AppColors.white,
      child: DottedBorder(
        color: AppColors.gray,
        padding: EdgeInsets.only(top: imageHeight / 2),
        dashPattern: const [10, 10],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildName(),
            _buildEmail(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return StreamBuilderWithLoading(
        stream: bloc.employeeSteam,
        builder: (EmployeeModel employeeModel) {
          return Text(
            employeeModel.fullName,
            style: _Style.nameTextStyle,
          );
        });
  }

  Widget _buildEmail() {
    return StreamBuilderWithLoading(
        stream: bloc.employeeSteam,
        builder: (EmployeeModel employeeModel) {
          return Text(
            employeeModel.email,
            style: _Style.emailTextStyle,
          );
        });
  }

  Widget _buildActions() {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildIndividualAction(Icons.phone),
          Container(width: 2, color: AppColors.gray),
          _buildIndividualAction(Icons.phone_iphone),
          Container(width: 2, color: AppColors.gray),
          _buildIndividualAction(Icons.email),
        ],
      ),
    );
  }

  Widget _buildIndividualAction(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [AppColors.lightBlue, AppColors.lightRed],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        iconData,
        size: 28,
        color: AppColors.hardGray,
      ),
    );
  }

  Widget _buildBasicInformationTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.getHeightFraction(0.03),
        horizontal: context.getWidthFraction(0.06),
      ),
      child: const Text(
        "Basic information",
        style: _Style.basicInformationTitleTextStyle,
      ),
    );
  }

  Widget _buildBasicInformation() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.getWidthFraction(0.06)),
      color: AppColors.white,
      child: Column(
        children: [
          Column(
            children: [
              InformationRowWidget(
                title: "First Name",
                stream: bloc.employeeSteam.map(
                    (EmployeeModel employeeModel) => employeeModel.firstName),
              ),
              InformationRowWidget(
                title: "Last Name",
                stream: bloc.employeeSteam.map(
                    (EmployeeModel employeeModel) => employeeModel.lastName),
              ),
              InformationRowWidget(
                title: "Email",
                stream: bloc.employeeSteam
                    .map((EmployeeModel employeeModel) => employeeModel.email),
              ),
              InformationRowWidget(
                title: "Contact Number",
                stream: bloc.employeeSteam.map((EmployeeModel employeeModel) =>
                    employeeModel.contactNumber),
              ),
              InformationRowWidget(
                title: "Age",
                stream: bloc.employeeSteam.map((EmployeeModel employeeModel) =>
                    employeeModel.age.toString()),
              ),
              InformationRowWidget(
                title: "DOB",
                stream: bloc.employeeSteam
                    .map((EmployeeModel employeeModel) => employeeModel.dob),
              ),
              InformationRowWidget(
                title: "Salary",
                stream: bloc.employeeSteam.map((EmployeeModel employeeModel) =>
                    employeeModel.salary.toString()),
              ),
              InformationRowWidget(
                title: "Address",
                stream: bloc.employeeSteam.map(
                    (EmployeeModel employeeModel) => employeeModel.address),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Style {
  static const TextStyle nameTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle emailTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.gray,
  );
  static const TextStyle basicInformationTitleTextStyle = TextStyle(
      fontSize: 22, color: AppColors.black, fontWeight: FontWeight.bold);
}
