import 'package:dio/dio.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_event.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_state.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/app_repository.dart';
import 'package:flower_store/src/services/product/product_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState()) {
    on<HomeLoaded>((event, emit) async {
      emit(HomeLoading());
      try {
        switch (event.role) {
          case RoleType.Seller:
            final _packageList = await AppRepository().package.get();
            print(_packageList.toString());
            emit(HomeLoadSucess(packageList: _packageList));
            break;
          default:
            final _productList = await AppRepository().product.getAllProduct();
            print(_productList.toString());
            emit(HomeLoadSucess(productList: _productList));
            break;
        }
      } catch (error) {
        if (error is Response)
          emit(HomeLoadedFail(message: error.data["message"]));
        else
          emit(HomeLoadedFail(message: error.toString()));
      }
    });
  }
}
