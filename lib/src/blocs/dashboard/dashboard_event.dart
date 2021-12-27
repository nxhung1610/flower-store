part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardLoaded extends DashboardEvent {}

class NavigatorPageTappedEvent extends DashboardEvent {
  final PageName curentPage;
  NavigatorPageTappedEvent({required this.curentPage});
  @override
  // TODO: implement props
  List<Object> get props => [this.curentPage];
}

