part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class NavigatorTappedPageState extends MainState {
  final PageName pageName;

  NavigatorTappedPageState({required this.pageName});
  @override
  // TODO: implement props
  List<Object> get props => [this.pageName];
}
