import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/services/app_repository.dart';

part 'manager_account_event.dart';
part 'manager_account_state.dart';

class ManagerAccountBloc
    extends Bloc<ManagerAccountEvent, ManagerAccountState> {
  List<Role> roles = [];
  ManagerAccountBloc() : super(ManagerAccountInitial()) {
    on<StaffLoadedEvent>((event, emit) async {
      try {
        roles = await AppRepository().authentication.roles();
        final staffs = await AppRepository().authentication.staffs();
        emit(StaffLoadedSuccess(staffs));
      } catch (error) {
        emit(StaffLoadedFailed(error.toString()));
      }
    });
  }
}
