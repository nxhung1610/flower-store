import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/models/bill/detail_bill.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailBill extends StatelessWidget {
  final DetailBill detailBill;
  const ProductDetailBill({Key? key, required this.detailBill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.color10,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.w),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: 70.h,
              height: 70.h,
              imageUrl: detailBill.product.image,
              errorWidget: (context, url, error) => Image(
                image: AssetImage('assets/template_plant.png'),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  detailBill.product.name,
                  style: AppTextStyle.header6.copyWith(
                    color: AppColors.color6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  detailBill.product.name,
                  style: AppTextStyle.header6.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.color7,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '(x${detailBill.quantity})',
                style: AppTextStyle.header6.copyWith(
                  color: AppColors.color3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Text(
                '${detailBill.totalPrice!.toInt()} VND',
                style: AppTextStyle.header6.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.color7,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
