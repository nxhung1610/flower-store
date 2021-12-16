part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  final List<DetailBill> detailBills;
  final String? nameCustomer;
  final String? phone;
  final String? email;
  CheckoutState(
      {this.nameCustomer, this.phone, this.email, required this.detailBills});

  CheckoutState copyWith(
      {List<DetailBill>? detailBills,
      String? nameCustomer,
      String? phone,
      String? email}) {
    return CheckoutState(
        detailBills: detailBills ?? this.detailBills,
        nameCustomer: nameCustomer ?? this.nameCustomer,
        phone: phone ?? this.phone,
        email: email ?? this.email);
  }

  @override
  List<Object?> get props => [detailBills, nameCustomer, phone, email];
}
