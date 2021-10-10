import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

enum PageName { Home, Package, Bill, Statistical }

class MainBloc extends Bloc<MainEvent, MainState> {
  PageName curentPage = PageName.Home;
  MainBloc() : super(NavigatorTappedPageState(pageName: PageName.Home)) {
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
