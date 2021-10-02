part of 'init_bloc.dart';

enum InitType {
  welcome,
  hadlogin,
  notlogin,
}

abstract class InitState extends Equatable {
  const InitState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitInitialState extends InitState {}

class InitLoadingState extends InitState {}

class InitSuccessState extends InitState {
  final InitType initType;
  const InitSuccessState({required this.initType});
  @override
  // TODO: implement props
  List<Object?> get props => [initType];
}

class InitFaliedState extends InitState {}
