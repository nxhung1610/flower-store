part of 'navigator_app_bar_bloc.dart';

abstract class NavigatorAppBarState extends Equatable {
  const NavigatorAppBarState();

  @override
  List<Object> get props => [];
}

class NavigatorTappedPageState extends NavigatorAppBarState {
  final PageName pageName;

  NavigatorTappedPageState({required this.pageName});
  @override
  // TODO: implement props
  List<Object> get props => [this.pageName];
}
