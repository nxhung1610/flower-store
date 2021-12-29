import 'package:another_flushbar/flushbar.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';
import 'package:flower_store/src/blocs/bill/bill_bloc.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/product_detail_bill.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
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
    return BlocListener<BillBloc, BillState>(
      listener: (context, state) {
        if (state is BillLoading) {
          ScreenTool.showLoading(context, state.isLoading);
        } else if (state is BillActionFail) {
          Flushbar(
              message: state.errorMessage,
              duration: Duration(
                milliseconds: 1000,
              )).show(context);
        } else if (state is BillActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(17.w),
                    color: AppColors.color10,
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '${NumberFormat("###,###,###").format(billBloc.bill.totalPrice)} VND',
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color3,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.color9,
            height: 1.h,
          ),
          [RoleType.Supplier, RoleType.Warehouse].contains(role) &&
                  billBloc.bill is Request
              ? _BottomBill(role: role, bill: billBloc.bill)
              : Container(),
        ],
      ),
    );
  }
}

class _BottomBill extends StatelessWidget {
  final Bill bill;
  final RoleType role;
  const _BottomBill({Key? key, required this.bill, required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.color10,
        child: IntrinsicHeight(
          child: Row(
            children: [
              ((role == RoleType.Supplier &&
                          !((bill as Request).approve ?? false) &&
                          (bill as Request).status ==
                              RequestStatus.Pending.index) ||
                      (role == RoleType.Warehouse &&
                          ((bill as Request).approve ?? false)))
                  ? Expanded(
                      child: InkWell(
                        splashFactory: InkRipple.splashFactory,
                        onTap: () {
                          if (role == RoleType.Supplier) {
                            context.read<BillBloc>().add(BillApprove());
                          } else
                            context.read<BillBloc>().add(BillDone());
                        },
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
                          RequestExtension.getValue(
                                  (bill as Request).status!) ==
                              RequestStatus.Done)
                  ? Container()
                  : VerticalDivider(
                      width: 1.w,
                      color: AppColors.color9,
                    ),
              role == RoleType.Supplier ||
                      (role == RoleType.Warehouse &&
                          RequestExtension.getValue(
                                  (bill as Request).status!) !=
                              RequestStatus.Pending)
                  ? Container()
                  : Expanded(
                      child: InkWell(
                        splashFactory: InkRipple.splashFactory,
                        onTap: () {
                          context.read<BillBloc>().add(BillCancel());
                        },
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
      ),
    );
  }
}
