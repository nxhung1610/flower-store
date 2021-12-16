import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/bill/bill.dart';
import 'package:flower_store/src/models/bill/detail_bill.dart';
import 'package:flower_store/src/models/cart/cart_product.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({required List<CartProduct> productsInCart})
      : super(CheckoutState(
          detailBills: productsInCart
              .map(
                (e) => DetailBill.fromCartProduct(cartProduct: e),
              )
              .toList(),
        )) {
    on<NameCustomerChanged>((event, emit) {
      emit(state.copyWith(nameCustomer: event.nameCustomer));
    });
    on<EmailCustomerChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PhoneCustomerChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
  }
}
