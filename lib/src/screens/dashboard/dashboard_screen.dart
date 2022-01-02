import 'package:badges/badges.dart';
import 'package:flower_store/src/blocs/bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_state.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_bloc.dart';
import 'package:flower_store/src/blocs/invoice/invoice_bloc.dart';
import 'package:flower_store/src/blocs/request/request_bloc.dart';
import 'package:flower_store/src/blocs/statistic/statistic_bloc.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/screens/dashboard/cart/cart_page.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'app_slider_bar.dart';
import 'bill/bill_page.dart';
import 'home/home_page.dart';
import 'package/package_page.dart';
import 'statistical/statistical_page.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context.read<DashboardBloc>().add(DashboardLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SlideBarMenuBloc>(
          create: (context) => SlideBarMenuBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<PackageBloc>(
          create: (context) => PackageBloc(),
        ),
        BlocProvider<InvoiceBloc>(
          create: (context) => InvoiceBloc(),
        ),
        BlocProvider<RequestBloc>(
          create: (context) => RequestBloc(),
        ),
        BlocProvider<StatisticBloc>(
          create: (context) => StatisticBloc(),
        )
      ],
      child: ScreenConfig(
        builder: () => BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) => Scaffold(
            key: scaffoldKey,
            drawer: AppSliderBar(
                staff: (context.read<AuthBloc>().state
                        as AuthenticationAuthenticated)
                    .staff),
            appBar: _buildAppbar(scaffoldKey, context),
            body: _BodyScreen(
              state: state,
            ),
            bottomNavigationBar: _buildBottomNavigation(context),
          ),
        ),
      ),
    );
  }
}

Widget cartIcon(BuildContext context) {
  RoleType role =
      (context.read<AuthBloc>().state as AuthenticationAuthenticated)
          .staff
          .role;
  return [RoleType.Seller, RoleType.Warehouse].contains(role)
      ? BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return Badge(
              badgeColor: AppColors.color3,
              position: BadgePosition.topEnd(top: 1.h, end: 3.h),
              elevation: 0,
              badgeContent: Text(
                '${state.cartProducts.map((product) => product.quantity).sum}',
                style: AppTextStyle.header7.copyWith(
                  color: AppColors.color10,
                ),
              ),
              child: IconButton(
                iconSize: 30.h,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CartPage.nameRoute,
                  );
                },
                icon: SvgPicture.asset('assets/ico_cart.svg'),
              ));
        })
      : SizedBox.shrink();
}

_buildAppbar(GlobalKey<ScaffoldState> key, BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.color10,
    elevation: 0.5,
    title: Text(
      context.read<DashboardBloc>().curentPage.toString().split('.').last,
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
    actions: [
      cartIcon(context),
    ],
  );
}

_buildBottomNavigation(BuildContext context) {
  return BottomNavigationBar(
    currentIndex:
        context.read<DashboardBloc>().curentPage?.index ?? PageName.Home.index,
    onTap: (value) {
      context
          .read<DashboardBloc>()
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
          color: BlocProvider.of<DashboardBloc>(context).curentPage ==
                  PageName.Home
              ? AppColors.color2
              : AppColors.color6,
        ),
        PageName.Home.toString().split('.').last,
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_package.svg',
          color: BlocProvider.of<DashboardBloc>(context).curentPage ==
                  PageName.Package
              ? AppColors.color2
              : AppColors.color6,
        ),
        PageName.Package.toString().split('.').last,
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_bill.svg',
          color: BlocProvider.of<DashboardBloc>(context).curentPage ==
                  PageName.Bill
              ? AppColors.color2
              : AppColors.color6,
        ),
        PageName.Bill.toString().split('.').last,
      ),
      _buildBottomNavigationItem(
        SvgPicture.asset(
          'assets/ico_statistical.svg',
          color: BlocProvider.of<DashboardBloc>(context).curentPage ==
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
  final DashboardState state;
  const _BodyScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state is DashboardInitState) return Container();
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardLoading) {
          ScreenTool.showLoading(context, state.isLoading);
        }
      },
      child: (() {
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
      }()),
    );
  }
}
