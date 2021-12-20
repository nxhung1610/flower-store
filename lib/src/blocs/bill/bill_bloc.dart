import 'package:flower_store/src/blocs/bill/bill_event.dart';
import 'package:flower_store/src/models/bill/bill.dart';
import 'package:flower_store/src/services/bill/bill_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  BillBloc() : super(BillInitial()) {
    on<BillEvent>((event, emit) async {
      List<Bill> _billList = [];
      _billList = await BillProvider().get();
      emit(BillLoadSucess(billList: _billList));
    });
  }
}
