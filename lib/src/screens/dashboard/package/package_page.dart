import 'package:flower_store/src/blocs/dashboard/package/package_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_state.dart';
import 'package:flower_store/src/screens/dashboard/home/widget/product_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PackagePage extends StatefulWidget {
  PackagePage({Key? key}) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Container(
        child: BlocBuilder<PackageBloc, PackageState>(
          builder: (context, state) {
            if (state is PackageLoadSucess) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                physics: BouncingScrollPhysics(),
                itemCount: state.productList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  return ProductWidget(
                    page: pageOfWidget.PACKAGE,
                    product: state.productList[index],
                  );
                },
              );
            } else {
              return Center(child: SpinKitRing(color: AppColors.color1));
            }
          },
        ),
      ),
    );
  }
}
