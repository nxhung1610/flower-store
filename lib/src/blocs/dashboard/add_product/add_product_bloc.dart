import 'package:flower_store/src/blocs/dashboard/add_product/add_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_helper.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitState()) {
    on<AddProductChooseImage>((event, emit) async {
      emit(AddProductPickImageInitial());
      final image = await openImagePicker();
      if (image != null) {
        emit(AddProductChooseImageSuccess(image: image));
      } else
        emit(AddProductChooseImageFail());
    });
  }
}
