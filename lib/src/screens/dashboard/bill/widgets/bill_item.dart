import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/base/bill/detail_bill.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BillItem extends StatelessWidget {
  final Bill bill;
  final Function() onClick;
  final Function()? onNegative;
  final Function()? onPositive;
  final RoleType role;
  const BillItem(
      {Key? key,
      required this.bill,
      required this.onClick,
      this.onNegative,
      this.onPositive,
      required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.color4,
              padding: EdgeInsets.all(15.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/ico_global.svg',
                    color: bill is Invoice
                        ? AppColors.color7
                        : (() {
                            switch (RequestExtension.getValue(
                                (bill as Request).status!)) {
                              case RequestStatus.Done:
                                return AppColors.color3;
                              case RequestStatus.Pending:
                                return Color(0xffedbc34);
                              default:
                                return AppColors.color8;
                            }
                          }()),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    '#${bill.id.toString().replaceRange(10, bill.id!.length, '...')}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.header5.copyWith(
                      color: AppColors.color7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    DateFormat('MMM dd,yyyy').format(bill.createdAt!),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.header5.copyWith(
                      color: AppColors.color6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _productListToString(bill.details!),
                    style: AppTextStyle.header5.copyWith(
                      color: AppColors.color6,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '${bill.details!.map((e) => e.quantity).reduce((value, element) => value! + element!)} item(s)',
                        style: AppTextStyle.header5.copyWith(
                          color: AppColors.color7,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '${NumberFormat("###,###,###").format(bill.totalPrice)} VND',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.header5.copyWith(
                          color: AppColors.color7,
                          fontWeight: FontWeight.lerp(
                              FontWeight.w400, FontWeight.w600, 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _productListToString(List<DetailBill> detailBills) {
    return detailBills.map((detail) {
      return '(x${detail.quantity}) ${detail.product.name}';
    }).join(", ");
  }

  
}
