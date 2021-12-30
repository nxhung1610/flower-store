import 'package:flower_store/src/blocs/Statistic/statistic_state.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';

import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flower_store/src/services/invoice/invoice_provider.dart';
import 'package:flower_store/src/services/request/request_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'statistic_event.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(StatisticInitial()) {
    on<StatisticLoaded>((event, emit) async {
      emit(StatisticLoading());
      List<Invoice> _invoiceList = [];
      List<Request> _requestList = [];
      _requestList = await RequestProvider().get();
      _invoiceList = await InvoiceProvider().get();
      var _requestMap = new Map();
      var _invoiceMap = new Map();

      _requestList.where((e) => e.staff!.id == event.staffId).forEach((e) {
        if (_requestMap.containsKey(e.createdAt!.month)) {
          _requestMap[e.createdAt!.month] += e.totalPrice;
        } else {
          _requestMap[e.createdAt!.month] = e.totalPrice;
        }
      });
      _invoiceList.where((e) => e.staff!.id == event.staffId).forEach((e) {
        if (_invoiceMap.containsKey(e.createdAt!.month)) {
          _invoiceMap[e.createdAt!.month] += e.totalPrice;
        } else {
          _invoiceMap[e.createdAt!.month] = e.totalPrice;
        }
      });

      emit(StatisticLoadSucess(
          invoiceMap: _invoiceMap, requestMap: _requestMap));
    });
  }
}
