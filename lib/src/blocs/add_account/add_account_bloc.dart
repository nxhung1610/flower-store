import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/utils/helper/app_helper.dart';

part 'add_account_event.dart';
part 'add_account_state.dart';

class AddAccountBloc extends Bloc<AddAccountEvent, AddAccountState> {
  AddAccountBloc() : super(AddAccountInitial()) {
    on<AddAccountChooseImage>(
      (event, emit) async {
        emit(AddAccountChoosingImage(isChoosing: true));
        final image = await openImagePicker();
        emit(AddAccountChoosingImage());
        if (image != null) {
          emit(AddAccountChooseImageSuccess(image: image.path));
        } else
          emit(AddAccountChooseImageFailed());
      },
    );
  }
}
