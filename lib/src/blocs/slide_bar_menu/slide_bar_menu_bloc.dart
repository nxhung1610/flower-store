import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/app_repository.dart';

part 'slide_bar_menu_event.dart';
part 'slide_bar_menu_state.dart';

class SlideBarMenuBloc extends Bloc<SlideBarMenuEvent, SlideBarMenuState> {
  List<Role> roles = [];

  SlideBarMenuBloc() : super(SlideBarMenuInitial()) {
    on<SlideBarMenuInit>((event, emit) async {});
  }
}
