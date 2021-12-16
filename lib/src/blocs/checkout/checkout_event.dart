part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class NameCustomerChanged extends CheckoutEvent {
  final String nameCustomer;

  NameCustomerChanged(this.nameCustomer);
  @override
  // TODO: implement props
  List<Object> get props => [nameCustomer];
}

class PhoneCustomerChanged extends CheckoutEvent {
  final String phone;

  PhoneCustomerChanged(this.phone);
  @override
  // TODO: implement props
  List<Object> get props => [phone];
}

class EmailCustomerChanged extends CheckoutEvent {
  final String email;

  EmailCustomerChanged(this.email);
  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class BillOrder extends CheckoutEvent {}
