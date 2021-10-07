import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_app_bar_event.dart';
part 'navigator_app_bar_state.dart';

enum PageName { Home, Package, Bill, Statistical }

class NavigatorAppBarBloc
    extends Bloc<NavigatorAppBarEvent, NavigatorAppBarState> {
  PageName curentPage = PageName.Home;
  NavigatorAppBarBloc()
      : super(NavigatorTappedPageState(pageName: PageName.Home)) {
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
