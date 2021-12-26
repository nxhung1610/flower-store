import 'package:flower_store/app.dart';
import 'package:flower_store/src/blocs/auth/auth_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_event.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_state.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_bloc.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/screens/dashboard/home/widget/product_bottom_sheet.dart';
import 'package:flower_store/src/screens/dashboard/home/widget/product_widget.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_product_page.dart';
import 'update_product_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeLoaded(
        role: (context.read<AuthBloc>().state as AuthenticationAuthenticated)
            .staff
            .role));
    super.initState();
  }

  Widget? floatingActionButton(RoleType role) {
    if (role == RoleType.Supplier)
      return FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/ico_plus.svg'),
          onPressed: () async {
            final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => AddProductBloc(),
                      child: AddProductPage(),
                    ),
                  ),
                ) ??
                false;
            if (result == true) {
              BlocProvider.of<HomeBloc>(context).add(HomeLoaded(
                  role: (context.read<AuthBloc>().state
                          as AuthenticationAuthenticated)
                      .staff
                      .role));
            }
          },
        ),
        backgroundColor: AppColors.color2,
      );
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    RoleType role =
        (context.read<AuthBloc>().state as AuthenticationAuthenticated)
            .staff
            .role;
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: (role == RoleType.Accountant || role == RoleType.Manager)
          ? Center(
              child: SvgPicture.asset(
                'assets/icon.svg',
                height: 110.h,
                width: 112.w,
                fit: BoxFit.fill,
              ),
            )
          : Container(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadSucess) {
                    if (state.productList != null)
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        physics: BouncingScrollPhysics(),
                        itemCount: state.productList!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 5.h),
                        itemBuilder: (context, index) {
                          return ProductWidget(
                            role: role,
                            onEdit: () async {
                              final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => UpdateProductBloc(
                                            state.productList![index]),
                                        child: UpdateProductPage(),
                                      ),
                                    ),
                                  ) ??
                                  false;
                              if (result == true) {
                                BlocProvider.of<HomeBloc>(context).add(
                                    HomeLoaded(
                                        role: (context.read<AuthBloc>().state
                                                as AuthenticationAuthenticated)
                                            .staff
                                            .role));
                              }
                            },
                            onClick: () async {
                              if (role == RoleType.Seller ||
                                  role == RoleType.Warehouse) {
                                BlocProvider.of<CartBloc>(context).add(
                                    CartBottomDialogPressed(
                                        selectedProduct:
                                            CartProduct.fromProduct(
                                                state.productList![index])));

                                showBottomDialog(
                                    context, state.productList![index]);
                              }
                            },
                            product: state.productList![index],
                          );
                        },
                      );
                    else if (state.packageList != null)
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.packageList!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 5.h),
                        itemBuilder: (context, index) {
                          return ProductWidget(
                            role: role,
                            onClick: () {
                              if (role == RoleType.Seller ||
                                  role == RoleType.Warehouse) {
                                BlocProvider.of<CartBloc>(context).add(
                                    CartBottomDialogPressed(
                                        selectedProduct:
                                            CartProduct.fromProduct(state
                                                .packageList![index].product)));

                                showBottomDialog(
                                    context, state.packageList![index].product);
                              }
                            },
                            product: state.packageList![index].product,
                          );
                        },
                      );
                    else {
                      return Center(
                        child: LoadingWidget(),
                      );
                    }
                  } else {
                    return Center(
                      child: LoadingWidget(),
                    );
                  }
                },
              ),
            ),
      floatingActionButton: floatingActionButton(role),
    );
  }

  void showBottomDialog(BuildContext context, Product product) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return ProductBottomSheet(product: product);
      },
    );
  }
}
