part of 'bill_bloc.dart';

abstract class BillEvent extends Equatable {
  const BillEvent();

  @override
  List<Object> get props => [];
}

class BillApprove extends BillEvent {}

class BillDone extends BillEvent {}

class BillCancel extends BillEvent {}
