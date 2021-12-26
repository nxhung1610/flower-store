import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_event.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_state.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/screens/dashboard/home/widget/product_widget.dart';
import 'package:flower_store/src/screens/dashboard/package/widgets/package_item.dart';
import 'package:flower_store/src/utils/components/error_widget.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackagePage extends StatefulWidget {
  PackagePage({Key? key}) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  void initState() {
    context.read<PackageBloc>().add(PackageLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RoleType role =
        (context.read<AuthBloc>().state as AuthenticationAuthenticated)
            .staff
            .role;
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: (role != RoleType.Warehouse)
          ? Center(
              child: SvgPicture.asset(
                'assets/icon.svg',
                height: 110.h,
                width: 112.w,
                fit: BoxFit.fill,
              ),
            )
          : Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: AppColors.color3,
                    padding: EdgeInsets.symmetric(vertical: 21.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ID',
                            style: AppTextStyle.header5.copyWith(
                              color: AppColors.color10,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'NAME',
                            style: AppTextStyle.header5.copyWith(
                              color: AppColors.color10,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'QUANTITY',
                            style: AppTextStyle.header5.copyWith(
                              color: AppColors.color10,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      color: AppColors.color3,
                      onRefresh: () async {
                        context.read<PackageBloc>().add(PackageLoaded());
                      },
                      child: BlocBuilder<PackageBloc, PackageState>(
                        builder: (context, state) {
                          if (state is PackageLoadSucess) {
                            return Container(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemBuilder: (context, index) => PackageItem(
                                    package: state.packageList[index]),
                                separatorBuilder: (context, index) => Divider(
                                  color: AppColors.color9,
                                  height: 1.h,
                                ),
                                itemCount: state.packageList.length,
                              ),
                            );
                          } else if (state is PackageLoadFail) {
                            return CustomErrorWidget(
                              message: state.message,
                            );
                          } else if (state is PackageLoading) {
                            return Center(
                              child: LoadingWidget(),
                            );
                          } else
                            return Container();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
