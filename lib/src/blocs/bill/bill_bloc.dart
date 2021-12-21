import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  final Bill bill;
  BillBloc({required this.bill}) : super(BillInitial()) {
    on<BillEvent>((event, emit) {
      
    });
  }
}
