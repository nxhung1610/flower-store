import 'package:flower_store/src/blocs/main/main_bloc.dart';
import 'package:flower_store/src/blocs/main/slider_bar/app_slider_bar.dart';
import 'package:flower_store/src/screens/main/page.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  static const String nameRoute = '/main';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => MainScreen(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenConfig(
      builder: () => BlocBuilder<MainBloc, MainState>(
        builder: (context, state) => Scaffold(
          key: scaffoldKey,
          drawer: AppSliderBar(),
          appBar: _buildAppbar(scaffoldKey, context),
          body: _BodyScreen(
            state: state,
          ),
          bottomNavigationBar: _buildBottomNavigation(context),
        ),
      ),
    );
  }
}

_buildAppbar(GlobalKey<ScaffoldState> key, BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.color10,
    elevation: 0.5,
    title: Text(
      BlocProvider.of<MainBloc>(context).curentPage.toString().split('.').last,
      style: AppTextStyle.header4.copyWith(
        color: AppColors.color6,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () => key.currentState?.openDrawer(),
      icon: SvgPicture.asset('assets/ico_menu.svg'),
    ),
    actions: [],
  );
}

_buildBottomNavigation(BuildContext context) {
  return BottomNavigationBar(
    currentIndex: BlocProvider.of<MainBloc>(context).curentPage.index,
    onTap: (value) {
      BlocProvider.of<MainBloc>(context)
          .add(NavigatorPageTappedEvent(curentPage: PageName.values[value]));
    },
    type: BottomNavigationBarType.fixed,
    iconSize: 32.w,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: AppColors.color2,
    backgroundColor: AppColors.color10,
    items: [
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_home.svg',
          color: BlocProvider.of<MainBloc>(context).curentPage == PageName.Home
              ? AppColors.color2
              : AppColors.color6,
        ),
        PageName.Home.toString().split('.').last,
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_package.svg',
          color:
              BlocProvider.of<MainBloc>(context).curentPage == PageName.Package
                  ? AppColors.color2
                  : AppColors.color6,
        ),
        PageName.Package.toString().split('.').last,
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_bill.svg',
          color: BlocProvider.of<MainBloc>(context).curentPage == PageName.Bill
              ? AppColors.color2
              : AppColors.color6,
        ),
        PageName.Bill.toString().split('.').last,
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_statistical.svg',
          color: BlocProvider.of<MainBloc>(context).curentPage ==
                  PageName.Statistical
              ? AppColors.color2
              : AppColors.color6,
        ),
        PageName.Statistical.toString().split('.').last,
      ),
    ],
  );
}

_buildBottomNavigationItem(Widget icon, String title) {
  return BottomNavigationBarItem(icon: icon, label: title);
}

class _BodyScreen extends StatelessWidget {
  final MainState state;
  const _BodyScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch ((state as NavigatorTappedPageState).pageName) {
      case PageName.Home:
        return HomePage();
      case PageName.Package:
        return PackagePage();
      case PageName.Bill:
        return BillPage();
      case PageName.Statistical:
        return StatisticalPage();
      default:
        return Container();
    }
  }
}
