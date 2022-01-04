import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/enums.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeEvent {
  final RoleType role;

  HomeLoaded({required this.role});
  @override
  // TODO: implement props
  List<Object?> get props => [role];
}
