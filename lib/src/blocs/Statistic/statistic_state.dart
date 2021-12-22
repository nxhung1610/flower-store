import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';

class StatisticState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoadSucess extends StatisticState {
  final List<Invoice> invoiceList;

  StatisticLoadSucess({required this.invoiceList});

  @override
  List<Object> get props => [invoiceList];
}
