import 'package:flower_store/src/blocs/invoice/invoice_bloc.dart';
import 'package:flower_store/src/blocs/request/request_bloc.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/screens/dashboard/bill/detail_bill_page.dart';
import 'package:flower_store/src/screens/dashboard/bill/invoice/invoice_tab.dart';
import 'package:flower_store/src/screens/dashboard/bill/request/request_tab.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/bill_item_row.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillPage extends StatefulWidget {
  BillPage({Key? key}) : super(key: key);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.color10,
        body: Container(
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColors.color3,
                tabs: [
                  Tab(
                    child: Text(
                      'Invoice',
                      style: AppTextStyle.header5.copyWith(
                        color: AppColors.color8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Request',
                      style: AppTextStyle.header5.copyWith(
                        color: AppColors.color8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
                controller: tabController,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    InvoiceTab(),
                    RequestTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
