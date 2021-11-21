import 'package:flower_store/src/blocs/dashboard/add_product/add_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_helper.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc() : super(UpdateProductInitState()) {
    on<UpdateProductChooseImage>((event, emit) async {
      emit(UpdateProductPickImageInitial());
      final image = await openImagePicker();
      if (image != null) {
        emit(UpdateProductChooseImageSuccess(image: image));
      } else
        emit(UpdateProductChooseImageFail());
    });
  }
}
