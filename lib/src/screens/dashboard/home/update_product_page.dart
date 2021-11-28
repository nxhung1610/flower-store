import 'dart:io';

import 'package:flower_store/src/blocs/dashboard/add_product/add_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_state.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_state.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/ico_delete.svg'))
        ],
        elevation: 1,
        iconTheme: IconThemeData(
          color: AppColors.color5,
        ),
        centerTitle: true,
        backgroundColor: AppColors.color10,
        title: Text(
          'Edit Product',
          style: AppTextStyle.header4
              .copyWith(fontWeight: FontWeight.bold, color: AppColors.color5),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
            child: Column(
              children: [
                InkWell(
                  onTap: () => BlocProvider.of<UpdateProductBloc>(context)
                      .add(UpdateProductChooseImage()),
                  child: BlocBuilder<UpdateProductBloc, UpdateProductState>(
                    builder: (context, state) {
                      return state is UpdateProductChooseImageSuccess
                          ? SizedBox(
                              width: 260,
                              height: 190,
                              child: Container(
                                color: AppColors.color1,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.file(
                                    File(
                                      state.image.path,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon.svg',
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 77.w),
                                    child: Text('Choose your product image',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.header4
                                            .copyWith(color: AppColors.color2)),
                                  )
                                ],
                              ),
                            );
                    },
                  ),
                ),
                SizedBox(height: 60.h),
                TextField(
                  cursorColor: AppColors.color8,
                  style:
                      AppTextStyle.paragraph.copyWith(color: AppColors.color8),
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    filled: true,
                    fillColor: AppColors.color4,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 28.h),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.color8,
                  style:
                      AppTextStyle.paragraph.copyWith(color: AppColors.color8),
                  decoration: InputDecoration(
                    hintText: "Price",
                    filled: true,
                    fillColor: AppColors.color4,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 28.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.color4,
                  ),
                  constraints: BoxConstraints(minHeight: 250.h),
                  child: TextField(
                    maxLines: null,
                    maxLength: 500,
                    keyboardType: TextInputType.multiline,
                    cursorColor: AppColors.color8,
                    style: AppTextStyle.paragraph
                        .copyWith(color: AppColors.color8),
                    decoration: InputDecoration(
                        counter: Offstage(),
                        hintText: "Description",
                        // filled: true,
                        // fillColor: AppColors.color4,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                        //     borderRadius: BorderRadius.circular(10)),
                        ),
                  ),
                ),
                SizedBox(height: 40.h),
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 250.w, height: 50.h),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.color2)),
                      onPressed: () {},
                      child: Text(
                        "Update",
                        style: AppTextStyle.header5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.color10),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
