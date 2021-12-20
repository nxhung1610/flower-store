import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/bill/bill.dart';

class BillState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BillInitial extends BillState {}

class BillLoadSucess extends BillState {
  final List<Bill> billList;

  BillLoadSucess({required this.billList});

  @override
  List<Object> get props => [billList];
}
