import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_expandable_widget.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_widget/detail_bill_info_widget.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/product_detail_bill.dart';
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
          elevation: 1,
          iconTheme: IconThemeData(
            color: AppColors.color5,
          ),
          centerTitle: true,
          backgroundColor: AppColors.color10,
          title: Text(
            'Detail Bill',
            style: AppTextStyle.header4.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.color5,
            ),
          ),
        ),
        body: _BodyScreen(),
      ),
    );
  }
}

class _BodyScreen extends StatelessWidget {
  const _BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final billBloc = context.read<BillBloc>();
    var role = (context.read<AuthBloc>().state as AuthenticationAuthenticated)
        .staff
        .role;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.all(17.w),
                  color: AppColors.color10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            'assets/ico_global.svg',
                            height: 30.w,
                            width: 30.w,
                            color: billBloc.bill is Invoice
                                ? AppColors.color7
                                : (() {
                                    switch (RequestExtension.getValue(
                                        (billBloc.bill as Request).status!)) {
                                      case RequestStatus.Done:
                                        return AppColors.color3;
                                      case RequestStatus.Pending:
                                        return Color(0xffedbc34);
                                      default:
                                        return AppColors.color8;
                                    }
                                  }()),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#${billBloc.bill.id}',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.header5.copyWith(
                                color: AppColors.color6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              '${billBloc.bill.runtimeType} - ${billBloc.bill.details!.map((e) => e.quantity).reduce((value, element) => value! + element!)} item(s)',
                              style: AppTextStyle.header6.copyWith(
                                color: AppColors.color8,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Info person
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: AppColors.color10,
                  padding: EdgeInsets.all(17.w),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SvgPicture.asset(
                                  'assets/ico_staffs.svg',
                                  height: 30.w,
                                  color: AppColors.color7,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Staff',
                                      style: AppTextStyle.header5.copyWith(
                                        color: AppColors.color6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'ID - #${billBloc.bill.staff!.id}',
                                      style: AppTextStyle.header6.copyWith(
                                        color: AppColors.color3,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Name - ${billBloc.bill.staff!.name}',
                                      style: AppTextStyle.header6.copyWith(
                                        color: AppColors.color8,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      billBloc.bill is Invoice
                          ? SizedBox(
                              height: 17.h,
                            )
                          : Container(),
                      billBloc.bill is Invoice
                          ? Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset(
                                        'assets/ico_customer.svg',
                                        height: 30.w,
                                        color: AppColors.color7,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Customer',
                                            style:
                                                AppTextStyle.header5.copyWith(
                                              color: AppColors.color6,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            'Name - ${(billBloc.bill as Invoice).customer!.name}',
                                            style:
                                                AppTextStyle.header6.copyWith(
                                              color: AppColors.color3,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            'Phone - ${(billBloc.bill as Invoice).customer!.phone}',
                                            style:
                                                AppTextStyle.header6.copyWith(
                                              color: AppColors.color8,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            'Email - ${(billBloc.bill as Invoice).customer!.email}',
                                            style:
                                                AppTextStyle.header6.copyWith(
                                              color: AppColors.color8,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(17.w),
                  color: AppColors.color10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item(s)',
                        style: AppTextStyle.header5.copyWith(
                          color: AppColors.color6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ProductDetailBill(
                          detailBill: billBloc.bill.details![index],
                        ),
                        itemCount: billBloc.bill.details!.length,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        billBloc.bill is Invoice
            ? Container()
            : _bottomBill(role, billBloc.bill),
      ],
    );
  }

  Widget _bottomBill(RoleType role, Bill bill) {
    return Container(
      color: AppColors.color10,
      child: IntrinsicHeight(
        child: Row(
          children: [
            (role == RoleType.Supplier &&
                        !((bill as Request).approve ?? false) ||
                    (role == RoleType.Warehouse &&
                        ((bill as Request).approve ?? false)))
                ? Expanded(
                    child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Text(
                          role == RoleType.Supplier ? 'Approve' : 'Done',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            role == RoleType.Supplier ||
                    (role == RoleType.Warehouse &&
                        RequestExtension.getValue((bill as Request).status!) ==
                            RequestStatus.Done)
                ? Container()
                : VerticalDivider(
                    width: 1.w,
                    color: AppColors.color9,
                  ),
            role == RoleType.Supplier ||
                    (role == RoleType.Warehouse &&
                        RequestExtension.getValue((bill as Request).status!) ==
                            RequestStatus.Done)
                ? Container()
                : Expanded(
                    child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
