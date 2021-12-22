import 'package:flower_store/src/blocs/Statistic/statistic_state.dart';
import 'package:flower_store/src/blocs/auth/auth.dart';

import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/services/invoice/invoice_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'statistic_event.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(StatisticInitial()) {
    on<StatisticLoaded>((event, emit) async {
      List<Bill> _billList = [];
      _billList = await InvoiceProvider().get();
      print(_billList);
      emit(StatisticLoadSucess(billList: _billList));
    });
  }
}
