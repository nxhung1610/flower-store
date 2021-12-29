part of 'bill_bloc.dart';

abstract class BillState extends Equatable {
  const BillState();

  @override
  List<Object> get props => [];
}

class BillInitial extends BillState {}

class BillLoading extends BillState {
  final bool isLoading;

  BillLoading(this.isLoading);

  @override
  // TODO: implement props
  List<Object> get props => [isLoading];
}

class BillActionSuccess extends BillState {}

class BillActionFail extends BillState {
  final String errorMessage;

  BillActionFail({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
