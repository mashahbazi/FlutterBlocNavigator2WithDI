import 'package:casestudy/presentation/modules/core/base_screen.dart';
import 'package:casestudy/presentation/modules/splash/splash_bloc.dart';
import 'package:casestudy/presentation/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseScreenState<SplashScreen, SplashBloc> {
  @override
  Color get backgroundColor => AppColors.splash;

  @override
  PreferredSizeWidget? buildAppBar() => null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await bloc.initiateApp();
      bloc.navigateToListEmployees();
    });
  }

  @override
  Widget buildBody() {
    return Center(
        child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.5, end: 1.5),
      duration: SplashBloc.navigationDelay,
      builder: (BuildContext context, double scale, Widget? child) {
        return Text(
          "Tempo",
          style: _Style.getTitleTextStyle(scale),
        );
      },
      // builder: (BuildContext context, T value, Widget? child){
      // },
    ));
  }
}

class _Style {
  static TextStyle getTitleTextStyle(double scale) => TextStyle(
      color: AppColors.white,
      fontSize: 40 * scale,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
}
