import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

enum PageName { Home, Package, Bill, Statistical }

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  PageName? curentPage;
  Map<PageName, Widget> pages = {};
  DashboardBloc() : super(DashboardInitState()) {
    on<DashboardLoaded>((event, emit) {
      curentPage = PageName.Home;
      emit(NavigatorTappedPageState(pageName: PageName.Home));
    });

    on<NavigatorPageTappedEvent>(
      (event, emit) {
        curentPage = event.curentPage;
        switch (event.curentPage) {
          case PageName.Home:
            emit(NavigatorTappedPageState(pageName: PageName.Home));
            break;
          case PageName.Package:
            emit(NavigatorTappedPageState(pageName: PageName.Package));
            break;
          case PageName.Bill:
            emit(NavigatorTappedPageState(pageName: PageName.Bill));
            break;
          case PageName.Statistical:
            emit(NavigatorTappedPageState(pageName: PageName.Statistical));
            break;
          default:
        }
      },
    );
  }
}
