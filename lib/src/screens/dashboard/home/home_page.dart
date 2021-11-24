import 'package:flower_store/app.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_state.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_product_page.dart';
import 'widget/product_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: Container(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadSucess) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                physics: BouncingScrollPhysics(),
                itemCount: state.productList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  return ProductWidget(
                    page: pageOfWidget.HOME,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/ico_plus.svg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => AddProductBloc(),
                  child: AddProductPage(),
                ),
              ),
            );
          },
        ),
        backgroundColor: AppColors.color2,
      ),
    );
  }
}
