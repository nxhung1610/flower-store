part of 'invoice_bloc.dart';

abstract class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object> get props => [];
}

class InvoiceInitial extends InvoiceState {}

class InvoiceLoading extends InvoiceState {}

class InvoiceLoadedSuccess extends InvoiceState {
  final List<Invoice> invoices;

  InvoiceLoadedSuccess({required this.invoices});
  @override
  // TODO: implement props
  List<Object> get props => [invoices];
}

class InvoiceLoadedFail extends InvoiceState {
  final String message;

  InvoiceLoadedFail({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
