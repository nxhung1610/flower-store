import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_helper.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_state.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProductPage extends StatelessWidget {
  final _nameTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: AppColors.color5,
        ),
        centerTitle: true,
        backgroundColor: AppColors.color10,
        title: Text(
          'Add Product',
          style: AppTextStyle.header4
              .copyWith(fontWeight: FontWeight.bold, color: AppColors.color5),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
          child: Column(
            children: [
              InkWell(
                onTap: () => BlocProvider.of<AddProductBloc>(context)
                    .add(AddProductChooseImage()),
                child: BlocBuilder<AddProductBloc, AddProductState>(
                  builder: (context, state) {
                    return state.image != ""
                        ? SizedBox(
                            width: 260,
                            height: 190,
                            child: Container(
                              color: Colors.transparent,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.file(
                                  File(
                                    state.image,
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
                controller: _nameTextController,
                cursorColor: AppColors.color8,
                style: AppTextStyle.paragraph.copyWith(color: AppColors.color8),
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
                controller: _priceTextController,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.color8,
                style: AppTextStyle.paragraph.copyWith(color: AppColors.color8),
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
                  controller: _descriptionTextController,
                  maxLines: null,
                  maxLength: 500,
                  keyboardType: TextInputType.multiline,
                  cursorColor: AppColors.color8,
                  style:
                      AppTextStyle.paragraph.copyWith(color: AppColors.color8),
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
                child: BlocConsumer<AddProductBloc, AddProductState>(
                  listener: (context, state) {
                    if (state.loading) ScreenTool.showLoading(context, true);
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.color2)),
                        onPressed: state.loading
                            ? null
                            : () {
                                if (_nameTextController.text.isEmpty ||
                                    _priceTextController.text.isEmpty) {
                                  Flushbar(
                                    title: "Fail",
                                    message: "Name or price can not be blank",
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                } else
                                  BlocProvider.of<AddProductBloc>(context).add(
                                    AddProductAddNewProduct(
                                      onComplete: (isSucesss) async {
                                        ScreenTool.showLoading(context, false);
                                        if (isSucesss == true) {
                                          await Flushbar(
                                            title: "Success",
                                            message: "Product uploaded",
                                            duration: Duration(seconds: 3),
                                          ).show(context);
                                          Navigator.pop(context, true);
                                        } else {
                                          await Flushbar(
                                            title: "Fail",
                                            message:
                                                "Upload product fail( Image must be jpeg , jpg or png) ",
                                            duration: Duration(seconds: 3),
                                          ).show(context);
                                        }
                                      },
                                      name: _nameTextController.text,
                                      description:
                                          _descriptionTextController.text,
                                      basePrice:
                                          int.parse(_priceTextController.text),
                                    ),
                                  );
                              },
                        child: Text(
                          "Add",
                          style: AppTextStyle.header5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color10),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
