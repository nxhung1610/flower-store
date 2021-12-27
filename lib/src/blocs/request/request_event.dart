part of 'request_bloc.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object> get props => [];
}

class RequestLoaded extends RequestEvent {}

class RequestApprove extends RequestEvent {
  final Request request;
  final Function(bool isLoading) loadingState;
  RequestApprove({required this.request,required this.loadingState});
  @override
  // TODO: implement props
  List<Object> get props => [request];
}
