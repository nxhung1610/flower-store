part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StatisticLoaded extends StatisticEvent {}

class StatisticChangeYear extends StatisticEvent {
  final int year;

  StatisticChangeYear({required this.year});
  @override
  // TODO: implement props
  List<Object?> get props => [year];
}
