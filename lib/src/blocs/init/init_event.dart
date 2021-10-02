part of 'init_bloc.dart';

abstract class InitEvent extends Equatable {
  const InitEvent();
}

class InitRequestedEvent extends InitEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
