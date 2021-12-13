import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_constant.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartWidget extends StatelessWidget {
  // final Product product;
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      child: Row(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fitHeight,
            width: 114.w,
            height: 114.h,
            //imageUrl: product.image,
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png",
            placeholder: (context, url) => SpinKitRing(
              color: AppColors.color1,
            ),
            errorWidget: (context, url, error) => Image(
              image: AssetImage('assets/template_plant.png'),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //product.name,
                        'TESTING',
                        style: AppTextStyle.header6.copyWith(
                            color: AppColors.color5,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        iconSize: 20.h,
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/ico_delete.svg'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  child: Text(
                    //product.description,
                    'Description',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.header7.copyWith(
                      color: AppColors.color5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.color3,
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.h))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 10.w,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              iconSize: 10.w,
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/ico_minus.svg'),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Text(
                              '1',
                              style: AppTextStyle.header5.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.color10,
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            IconButton(
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              iconSize: 12.w,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/ico_plus_amount.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      '30.000 VND',
                      style: AppTextStyle.header6.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.color2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
