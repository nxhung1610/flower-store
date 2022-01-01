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
  final Map billMap;
  final List<int> years;
  final int selectYear;
  StatisticLoadSucess({
    required this.selectYear,
    required this.years,
    required this.billMap,
  });

  @override
  List<Object> get props => [
        billMap,
        years,
        selectYear,
      ];

  StatisticLoadSucess copyWith({
    Map? billMap,
    List<int>? years,
    int? selectYear,
  }) {
    return StatisticLoadSucess(
      years: years ?? this.years,
      billMap: billMap ?? this.billMap,
      selectYear: selectYear ?? this.selectYear,
    );
  }
}
