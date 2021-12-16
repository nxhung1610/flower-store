part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  final List<DetailBill> detailBills;
  final String nameCustomer;
  final String phone;
  final String email;
  final bool isSuccess;
  final bool isLoading;
  final bool isError;
  final String? message;
  CheckoutState(
      {this.nameCustomer = "",
      this.phone = "",
      this.email = "",
      this.isSuccess = false,
      this.isLoading = false,
      this.isError = false,
      this.message,
      required this.detailBills});

  CheckoutState copyWith(
      {List<DetailBill>? detailBills,
      String? nameCustomer,
      String? phone,
      String? email,
      bool? isSuccess = false,
      bool? isLoading = false,
      bool? isError = false,
      String? message}) {
    return CheckoutState(
      detailBills: detailBills ?? this.detailBills,
      nameCustomer: nameCustomer ?? this.nameCustomer,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        this.detailBills,
        this.nameCustomer,
        this.phone,
        this.email,
        this.isLoading,
        this.isSuccess,
        this.isError,
        this.message
      ];
}
