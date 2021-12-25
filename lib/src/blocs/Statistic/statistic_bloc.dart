import 'package:flower_store/src/blocs/Statistic/statistic_state.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';

import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/services/invoice/invoice_provider.dart';
import 'package:flower_store/src/services/request/request_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'statistic_event.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(StatisticInitial()) {
    on<StatisticLoaded>((event, emit) async {
      List<Invoice> _invoiceList = [];
      List<Request> _requestList = [];
      _requestList = await RequestProvider().get();
      _invoiceList = await InvoiceProvider().get();
      print(_invoiceList);
      print(_requestList);
      emit(StatisticLoadSucess(invoiceList: _invoiceList));
    });
  }
}
