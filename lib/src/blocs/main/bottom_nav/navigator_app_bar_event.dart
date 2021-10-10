part of 'navigator_app_bar_bloc.dart';

abstract class NavigatorAppBarEvent extends Equatable {
  const NavigatorAppBarEvent();

  @override
  List<Object> get props => [];
}

class NavigatorPageTappedEvent extends NavigatorAppBarEvent {
  final PageName curentPage;
  NavigatorPageTappedEvent({required this.curentPage});
  @override
  // TODO: implement props
  List<Object> get props => [this.curentPage];
}
