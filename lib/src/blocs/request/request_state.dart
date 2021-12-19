part of 'request_bloc.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

class RequestInitial extends RequestState {}

class RequestLoadedSuccess extends RequestState {
  final List<Request> requestList;

  RequestLoadedSuccess({required this.requestList});

  @override
  // TODO: implement props
  List<Object> get props => [requestList];
}

class RequestLoadedFail extends RequestState {
  final String message;

  RequestLoadedFail({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class RequestLoading extends RequestState {}
