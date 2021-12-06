part of 'manager_account_bloc.dart';

abstract class ManagerAccountEvent extends Equatable {
  const ManagerAccountEvent();

  @override
  List<Object> get props => [];
}

class StaffLoadedEvent extends ManagerAccountEvent {}
