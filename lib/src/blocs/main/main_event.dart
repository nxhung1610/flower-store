part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class NavigatorPageTappedEvent extends MainEvent {
  final PageName curentPage;
  NavigatorPageTappedEvent({required this.curentPage});
  @override
  // TODO: implement props
  List<Object> get props => [this.curentPage];
}
