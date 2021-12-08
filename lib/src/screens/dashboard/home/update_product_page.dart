import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_state.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_bloc.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_state.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({
    key,
  }) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  late UpdateProductBloc bloc;
  @override
  void didChangeDependencies() {
    bloc = context.read<UpdateProductBloc>();
    super.didChangeDependencies();
    _nameTextController.text = bloc.state.name;
    _priceTextController.text = bloc.state.basePrice.toString();
    _descriptionTextController.text = bloc.state.description;
  }

  final _nameTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  Future<bool> showAlertDiag(Function(bool) onComplete) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Deleting'),
            content: const Text('Are you sure want to delete this product'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  bloc.add(
                    UpdateProductDelete(onComplete: onComplete),
                  );
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'OK',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final deleteComplete = await showAlertDiag((isSucesss) async {
                  ScreenTool.showLoading(context, false);
                  if (isSucesss == true) {
                    await Flushbar(
                      title: "Success",
                      message: "Delete product sucess",
                      duration: Duration(seconds: 3),
                    ).show(context);
                    Navigator.pop(context, true);
                  } else {
                    await Flushbar(
                      title: "Fail",
                      message: "Delete product fail ",
                      duration: Duration(seconds: 3),
                    ).show(context);
                  }
                });
                if (deleteComplete) ScreenTool.showLoading(context, true);
              },
              icon: SvgPicture.asset('assets/ico_delete.svg'))
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
                      return !state.image.contains("http")
                          ? Container(
                              width: 260.w,
                              height: 190.h,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.file(
                                  File(
                                    state.image,
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                width: 260.w,
                                height: 190.h,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: CachedNetworkImage(
                                    imageUrl: state.image,
                                    placeholder: (context, url) => SpinKitRing(
                                      color: Colors.transparent,
                                    ),
                                    errorWidget: (context, url, error) => Image(
                                      image: AssetImage(
                                          'assets/template_plant.png'),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ),
                SizedBox(height: 60.h),
                TextField(
                  controller: _nameTextController,
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
                  controller: _priceTextController,
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
                    controller: _descriptionTextController,
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
                  child: BlocConsumer<UpdateProductBloc, UpdateProductState>(
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
                                    BlocProvider.of<UpdateProductBloc>(context)
                                        .add(
                                      UpdateProductUpdateProduct(
                                        onComplete: (isSucesss) async {
                                          ScreenTool.showLoading(
                                              context, false);
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
                                        basePrice: int.parse(
                                            _priceTextController.text),
                                      ),
                                    );
                                },
                          child: Text(
                            "Update",
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
      ),
    );
  }
}
