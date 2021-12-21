import 'package:flower_store/src/blocs/invoice/invoice_bloc.dart';
import 'package:flower_store/src/blocs/request/request_bloc.dart';
import 'package:flower_store/src/screens/dashboard/bill/widgets/bill_item_row.dart';
import 'package:flower_store/src/utils/components/error_widget.dart';
import 'package:flower_store/src/utils/components/loading_widget.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../detail_bill_page.dart';

class RequestTab extends StatefulWidget {
  RequestTab({Key? key}) : super(key: key);

  @override
  _RequestTabState createState() => _RequestTabState();
}

class _RequestTabState extends State<RequestTab>
    with AutomaticKeepAliveClientMixin<RequestTab> {
  @override
  void initState() {
    context.read<RequestBloc>().add(RequestLoaded());
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
                  'REQUEST',
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
          child: RefreshIndicator(
            color: AppColors.color3,
            onRefresh: () async {
              context.read<RequestBloc>().add(RequestLoaded());
            },
            child: BlocBuilder<RequestBloc, RequestState>(
              builder: (context, state) {
                if (state is RequestLoadedSuccess) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: state.requestList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      height: 1.sp,
                    ),
                    itemBuilder: (context, index) {
                      return BillItem(
                        onClick: () {
                          Navigator.pushNamed(context, DetailBillPage.nameRoute,
                              arguments: state.requestList[index]);
                        },
                        bill: state.requestList[index],
                      );
                    },
                  );
                } else if (state is RequestLoading) {
                  return Center(
                    child: LoadingWidget(),
                  );
                } else if (state is RequestLoadedFail) {
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
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
