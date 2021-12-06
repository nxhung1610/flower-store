import 'package:flower_store/src/blocs/dashboard/home/home_event.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_state.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_event.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_state.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/product/product_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageBloc() : super(PackageInitState()) {
    on<PackageLoaded>((event, emit) async {
      List<Product> _productList = [];
      _productList = await ProductProvider().getAllProduct();
      print(_productList.toString());
      emit(PackageLoadSucess(productList: _productList));
    });
    add(PackageLoaded());
  }
}
