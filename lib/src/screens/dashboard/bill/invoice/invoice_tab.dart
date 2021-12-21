import 'package:flower_store/src/blocs/invoice/invoice_bloc.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_page.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/bill_item_row.dart';
import 'package:flower_store/src/utils/components/error_widget.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceTab extends StatefulWidget {
  InvoiceTab({Key? key}) : super(key: key);

  @override
  _InvoiceTabState createState() => _InvoiceTabState();
}

class _InvoiceTabState extends State<InvoiceTab> {
  @override
  void initState() {
    context.read<InvoiceBloc>().add(InvoiceLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 23.h),
          width: double.infinity,
          color: AppColors.color3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'INVOICE',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.header5.copyWith(
                    color: AppColors.color10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'DUE DATE',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.header5.copyWith(
                    color: AppColors.color10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'BALANCE',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.header5.copyWith(
                    color: AppColors.color10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1.w,
        ),
        Expanded(
          child: BlocBuilder<InvoiceBloc, InvoiceState>(
            builder: (context, state) {
              if (state is InvoiceLoadedSuccess) {
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.invoices.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 1.sp,
                  ),
                  itemBuilder: (context, index) {
                    return BillItem(
                      onClick: () {
                        Navigator.pushNamed(context, DetailBillPage.nameRoute,
                            arguments: state.invoices[index]);
                      },
                      bill: state.invoices[index],
                    );
                  },
                );
              } else if (state is InvoiceLoading) {
                return Center(
                  child: LoadingWidget(),
                );
              } else if (state is InvoiceLoadedFail) {
                return Center(
                  child: CustomErrorWidget(
                    message: (state).message,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}
