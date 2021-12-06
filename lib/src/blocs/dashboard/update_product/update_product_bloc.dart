import 'package:dio/dio.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_helper.dart';
import 'package:flower_store/src/blocs/dashboard/add_product/add_product_state.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_event.dart';
import 'package:flower_store/src/blocs/dashboard/update_product/update_product_state.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/product/product_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc(Product product)
      : super(UpdateProductState(
            loading: false,
            image: product.image,
            name: product.name,
            description: product.description,
            basePrice: product.basePrice,
            sId: product.sId)) {
    on<UpdateProductChooseImage>((event, emit) async {
      final image = await openImagePicker();
      if (image != null) {
        emit(state.copyWith(image: image.path));
      } else
        emit(state.copyWith(image: product.image));
    });
    on<UpdateProductUpdateProduct>(
      (event, emit) async {
        try {
          emit(state.copyWith(loading: true));
          await ProductProvider().updateProduct(
              sId: state.sId,
              name: event.name,
              image: state.image,
              description: event.description,
              basePrice: event.basePrice);
          if (event.onComplete == null) return;
          event.onComplete!(true);
        } on DioError catch (e) {
          print(e);
          print(" res ${e.response!.data}");
          if (event.onComplete == null) return;
          event.onComplete!(false);
        }
        emit(state.copyWith(loading: false));
      },
      transformer: debounce(
        Duration(seconds: 3),
      ),
    );
    on<UpdateProductDelete>(
      (event, emit) async {
        try {
          await ProductProvider().deleteProduct(
            sId: state.sId,
          );
          if (event.onComplete == null) return;
          event.onComplete!(true);
        } on DioError catch (e) {
          print(e);
          print(" res ${e.response!.data}");
          if (event.onComplete == null) return;
          event.onComplete!(false);
        }
      },
    );
  }
}
