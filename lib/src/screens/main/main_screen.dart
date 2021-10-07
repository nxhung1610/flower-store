import 'package:flower_store/src/blocs/main/navigator_bar/navigator_app_bar_bloc.dart';
import 'package:flower_store/src/screens/main/page.dart';
import 'package:flower_store/src/screens/main/widgets/main_appbar.dart';
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
  @override
  Widget build(BuildContext context) {
    return ScreenConfig(
      builder: () => BlocBuilder<NavigatorAppBarBloc, NavigatorAppBarState>(
        builder: (context, state) => Scaffold(
          appBar: MainAppBar(
            title: Text(
              BlocProvider.of<NavigatorAppBarBloc>(context)
                  .curentPage
                  .toString()
                  .split('.')
                  .last,
              style: AppTextStyle.header4.copyWith(
                color: AppColors.color5,
                fontWeight: FontWeight.bold,
              ),
            ),
            context: context,
          ),
          body: _BodyScreen(),
          bottomNavigationBar: _buildBottomNavigation(context),
        ),
      ),
    );
  }
}

_buildBottomNavigation(BuildContext context) {
  return BottomNavigationBar(
    currentIndex:
        BlocProvider.of<NavigatorAppBarBloc>(context).curentPage.index,
    onTap: (value) {
      BlocProvider.of<NavigatorAppBarBloc>(context)
          .add(NavigatorPageTappedEvent(curentPage: PageName.values[value]));
    },
    type: BottomNavigationBarType.fixed,
    iconSize: 32.w,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: AppColors.color2,
    backgroundColor: AppColors.color9,
    items: [
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_home.svg',
          color: BlocProvider.of<NavigatorAppBarBloc>(context).curentPage ==
                  PageName.Home
              ? AppColors.color2
              : AppColors.color5,
        ),
        BlocProvider.of<NavigatorAppBarBloc>(context).curentPage.toString(),
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_package.svg',
          color: BlocProvider.of<NavigatorAppBarBloc>(context).curentPage ==
                  PageName.Package
              ? AppColors.color2
              : AppColors.color5,
        ),
        BlocProvider.of<NavigatorAppBarBloc>(context).curentPage.toString(),
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_bill.svg',
          color: BlocProvider.of<NavigatorAppBarBloc>(context).curentPage ==
                  PageName.Bill
              ? AppColors.color2
              : AppColors.color5,
        ),
        BlocProvider.of<NavigatorAppBarBloc>(context).curentPage.toString(),
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_statistical.svg',
          color: BlocProvider.of<NavigatorAppBarBloc>(context).curentPage ==
                  PageName.Statistical
              ? AppColors.color2
              : AppColors.color5,
        ),
        BlocProvider.of<NavigatorAppBarBloc>(context).curentPage.toString(),
      ),
    ],
  );
}

_buildBottomNavigationItem(Widget icon, String title) {
  return BottomNavigationBarItem(icon: icon, label: title);
}

class _BodyScreen extends StatelessWidget {
  const _BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorAppBarBloc, NavigatorAppBarState>(
      builder: (context, state) {
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
      },
    );
  }
}
