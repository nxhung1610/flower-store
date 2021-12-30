import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/invoice/invoice.dart';

class StatisticState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoading extends StatisticState {}

class StatisticLoadSucess extends StatisticState {
  final Map invoiceMap;
  final Map requestMap;
  StatisticLoadSucess({
    required this.invoiceMap,
    required this.requestMap,
  });

  @override
  List<Object> get props => [
        invoiceMap,
        requestMap,
      ];
}
