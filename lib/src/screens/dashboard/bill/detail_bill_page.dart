import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_expandable_widget.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_info_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DetailBillPage extends StatefulWidget {
  static const String nameRoute = '/bill/detail';
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => DetailBillPage(),
      settings: settings,
    );
  }

  const DetailBillPage({Key? key}) : super(key: key);

  @override
  State<DetailBillPage> createState() => _DetailBillPageState();
}

class _DetailBillPageState extends State<DetailBillPage> {
  @override
  Widget build(BuildContext context) {
    var bill = ModalRoute.of(context)!.settings.arguments! as Bill;
    return BlocProvider<BillBloc>(
      create: (context) => BillBloc(bill: bill),
      child: Scaffold(
        backgroundColor: AppColors.color4,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.color5,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Detail Bill',
            style: AppTextStyle.header4.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.color5,
            ),
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 31.h),
                child: Column(
                  children: [
                    DetailBillStaff(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Builder(builder: (context) {
                      return DetailBillExpandable(
                          details: context.read<BillBloc>().bill.details!);
                    }),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: BoxDecoration(
                        color: AppColors.color10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 4),
                            child: Text(
                              'Total cost',
                              style: AppTextStyle.header5.copyWith(
                                  color: AppColors.color6,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Builder(builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20, top: 4),
                              child: Text(
                                '${NumberFormat("###,###,###").format(context.read<BillBloc>().bill.totalPrice)} VND',
                                style: AppTextStyle.header5.copyWith(
                                    color: AppColors.color2,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
