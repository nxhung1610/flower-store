import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/bloc.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/screens/manager_account/widgets/account_manager_item.dart';
import 'package:flower_store/src/screens/manager_account/widgets/account_manager_item_shimmer.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flower_store/src/utils/components/shimmer_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ManagerAccountPage extends StatefulWidget {
  static const String nameRoute = '/manager-account';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ManagerAccountPage(),
      settings: RouteSettings(name: nameRoute),
    );
  }

  ManagerAccountPage({Key? key}) : super(key: key);

  @override
  _ManagerAccountPageState createState() => _ManagerAccountPageState();
}

class _ManagerAccountPageState extends State<ManagerAccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ScreenConfig(
      builder: () => BlocProvider<ManagerAccountBloc>(
        create: (context) => ManagerAccountBloc(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            iconTheme: IconThemeData(
              color: AppColors.color5,
            ),
            centerTitle: true,
            backgroundColor: AppColors.color10,
            title: Text(
              'Manager Account',
              style: AppTextStyle.header4.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.color5),
            ),
          ),
          body: BodyScreen(),
        ),
      ),
    ));
  }
}

class BodyScreen extends StatefulWidget {
  BodyScreen({Key? key}) : super(key: key);

  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  void initState() {
    context.read<ManagerAccountBloc>().add(StaffLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerAccountBloc, ManagerAccountState>(
      builder: (context, state) {
        if (state is StaffLoadedSuccess) {
          var staffs = state.staffs;
          var roles = context.read<ManagerAccountBloc>().roles;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                child: ListView.separated(
              itemBuilder: (context, index) => AccountManagerItem(
                staff: staffs[index],
                roles: roles,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: staffs.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
              ),
            )),
          );
        } else if (state is StaffLoadedFailed) {
          return Container();
        } else {
          return Container(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => AccountManagerItemShimmer(),
            ),
          );
        }
      },
    );
  }
}