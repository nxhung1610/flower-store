part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class NavigatorTappedPageState extends DashboardState {
  final PageName pageName;

  NavigatorTappedPageState({required this.pageName});
  @override
  // TODO: implement props
  List<Object> get props => [this.pageName];
}

class MultiDeleteProductHomeScreen extends DashboardState {}
