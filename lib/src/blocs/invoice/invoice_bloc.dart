import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';
import 'package:flower_store/src/services/app_repository.dart';

part 'invoice_event.dart';
part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceLoaded, InvoiceState> {
  InvoiceBloc() : super(InvoiceInitial()) {
    on<InvoiceLoaded>((event, emit) async {
      emit(InvoiceLoading());
      try {
        final listInvoice = await AppRepository().invoice.get();
        listInvoice.sort((a,b)=> b.createdAt!.compareTo(a.createdAt!));
        emit(InvoiceLoadedSuccess(invoices: listInvoice));
      } catch (error) {
        if (error is Response)
          emit(InvoiceLoadedFail(message: error.data["message"]));
        else
          emit(InvoiceLoadedFail(message: error.toString()));
      }
    });
  }
}
