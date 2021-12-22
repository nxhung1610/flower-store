import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';

class StatisticState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoadSucess extends StatisticState {
  final List<Bill> billList;

  StatisticLoadSucess({required this.billList});

  @override
  List<Object> get props => [billList];
}
