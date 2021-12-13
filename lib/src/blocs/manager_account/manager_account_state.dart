part of 'manager_account_bloc.dart';

abstract class ManagerAccountState extends Equatable {
  const ManagerAccountState();

  @override
  List<Object> get props => [];
}

class ManagerAccountInitial extends ManagerAccountState {}

class StaffLoading extends ManagerAccountState {}

class StaffLoadedSuccess extends ManagerAccountState {
  final List<Staff> staffs;
  StaffLoadedSuccess(this.staffs);
  @override
  // TODO: implement props
  List<Object> get props => [staffs];
}

class StaffLoadedFailed extends ManagerAccountState {
  final String message;

  StaffLoadedFailed(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
