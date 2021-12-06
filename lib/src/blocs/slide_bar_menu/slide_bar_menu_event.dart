part of 'slide_bar_menu_bloc.dart';

abstract class SlideBarMenuEvent extends Equatable {
  const SlideBarMenuEvent();

  @override
  List<Object> get props => [];
}

class SlideBarMenuInit extends SlideBarMenuEvent {}
