part of 'statistic_bloc.dart';



class StatisticState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoading extends StatisticState {}

class StatisticLoadSucess extends StatisticState {
  final Map<int,Map<int,List<Bill>>> billMap;
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
    Map<int,Map<int,List<Bill>>>? billMap,
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
