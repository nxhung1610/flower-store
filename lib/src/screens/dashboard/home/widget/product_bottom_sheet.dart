import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/cart/cart_bloc.dart';
import 'package:flower_store/src/blocs/cart/cart_event.dart';
import 'package:flower_store/src/blocs/cart/cart_state.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductBottomSheet extends StatelessWidget {
  final Product product;
  const ProductBottomSheet({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.color10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
        ),
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5.w),
              child: Center(
                child: Container(
                  width: 100.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColors.color3,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.h),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              height: 411.h,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.w),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    errorWidget: (context, url, error) => Image(
                      image: AssetImage('assets/template_plant.png'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 17.h, top: 6.h, left: 30.w, right: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    this.product.name,
                    style: AppTextStyle.header4.copyWith(
                      color: AppColors.color6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    this.product.description,
                    style: AppTextStyle.header6.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.color8,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    this.product.basePrice.toString() + " VND",
                    style: AppTextStyle.header5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.color2,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 50,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25.w)),
                      child: Material(
                        child: Container(
                          padding: EdgeInsets.all(7.w),
                          decoration: BoxDecoration(
                            color: AppColors.color3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.w)),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                constraints: BoxConstraints(),
                                iconSize: 15.w,
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context).add(
                                      CartBottomDialogAmountDecrementPressed());
                                },
                                icon: SvgPicture.asset('assets/ico_minus.svg'),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  return Text(
                                    state.selectedProduct!.quantity.toString(),
                                    style: AppTextStyle.header5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.color10,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              IconButton(
                                constraints: BoxConstraints(),
                                iconSize: 15.w,
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context).add(
                                      CartBottomDialogAmountIncrementPressed());
                                },
                                icon: SvgPicture.asset(
                                    'assets/ico_plus_amount.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: AppColors.color3.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.w),
                        ),
                      ),
                      onPressed: () async {
                        await Future.delayed(Duration(milliseconds: 300));
                        BlocProvider.of<CartBloc>(context)
                            .add(CartBottomDialogAddPress());
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.w),
                        child: Text(
                          'ADD TO CART',
                          style: AppTextStyle.header5.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.color2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
