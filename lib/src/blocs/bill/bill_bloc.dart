import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/request/request.dart';
import 'package:flower_store/src/services/app_repository.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  final Bill bill;
  BillBloc({required this.bill}) : super(BillInitial()) {
    on<BillApprove>((event, emit) async {
      emit(BillLoading(true));
      try {
        await AppRepository().request.approve(request: bill as Request);
        emit(BillLoading(false));
        emit(BillActionSuccess());
      } catch (error) {
        await Future.delayed(Duration(milliseconds: 300));
        emit(BillLoading(false));
        await Future.delayed(Duration(milliseconds: 300));
        emit(BillActionFail(errorMessage: error.toString()));
      }
    });

    on<BillDone>((event, emit) async {
      emit(BillLoading(true));
      try {
        await AppRepository().request.done(request: bill as Request);
        emit(BillLoading(false));
        emit(BillActionSuccess());
      } catch (error) {
        await Future.delayed(Duration(milliseconds: 300));
        emit(BillLoading(false));
        await Future.delayed(Duration(milliseconds: 300));
        emit(BillActionFail(errorMessage: error.toString()));
      }
    });

    on<BillCancel>((event, emit) async {
      emit(BillLoading(true));
      try {
        await AppRepository().request.cancel(request: bill as Request);
        emit(BillLoading(false));
        emit(BillActionSuccess());
      } catch (error) {
        await Future.delayed(Duration(milliseconds: 300));
        emit(BillLoading(false));
        await Future.delayed(Duration(milliseconds: 300));
        emit(BillActionFail(errorMessage: error.toString()));
      }
    });
  }
}
