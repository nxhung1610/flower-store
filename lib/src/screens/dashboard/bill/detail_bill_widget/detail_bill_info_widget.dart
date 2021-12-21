import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBillStaff extends StatelessWidget {
  const DetailBillStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bill = context.read<BillBloc>().bill;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color10,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Container(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '#${bill.id.toString().replaceRange(10, context.read<BillBloc>().bill.id!.length, '...')}',
                    style: AppTextStyle.header6.copyWith(
                      color: AppColors.color6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    DateFormat('MMM dd,yyyy')
                        .format(context.read<BillBloc>().bill.createdAt!),
                    style: AppTextStyle.header6.copyWith(
                      color: AppColors.color7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Container(
                height: 0.5.h,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        'assets/ico_staffs.svg',
                        height: 25.h,
                        color: AppColors.color6,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: IntrinsicWidth(
                      child: Text(
                        bill.staff!.name!,
                        style: AppTextStyle.header6.copyWith(
                          color: AppColors.color6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '#${bill.staff?.id.toString().replaceRange(10, context.read<BillBloc>().bill.staff?.id!.length, '...')}',
                            style: AppTextStyle.header6.copyWith(
                              color: AppColors.color8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${bill.staff?.name}',
                            style: AppTextStyle.header6.copyWith(
                              color: AppColors.color2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bill is Invoice
                ? SizedBox(
                    height: 15.w,
                  )
                : Container(),
            bill is Invoice
                ? Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                              'assets/ico_customer.svg',
                              height: 25.h,
                              color: AppColors.color6,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: IntrinsicWidth(
                            child: Text(
                              '${(bill as Invoice).customer?.name}',
                              style: AppTextStyle.header6.copyWith(
                                color: AppColors.color6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '#${bill.staff?.id.toString().replaceRange(10, context.read<BillBloc>().bill.staff?.id!.length, '...')}',
                                  style: AppTextStyle.header6.copyWith(
                                    color: AppColors.color8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${bill.staff?.name}',
                                  style: AppTextStyle.header6.copyWith(
                                    color: AppColors.color2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
