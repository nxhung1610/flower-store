part of 'bill_bloc.dart';

abstract class BillState extends Equatable {
  const BillState();
  
  @override
  List<Object> get props => [];
}

class BillInitial extends BillState {}


class BillLoading extends BillState{}
