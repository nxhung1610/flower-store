import 'package:flower_store/src/blocs/dashboard/home/home_event.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_state.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_event.dart';
import 'package:flower_store/src/blocs/dashboard/package/package_state.dart';
import 'package:flower_store/src/models/package/package.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/services/app_repository.dart';
import 'package:flower_store/src/services/product/product_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageBloc() : super(PackageInitState()) {
    on<PackageLoaded>((event, emit) async {
      emit(PackageLoading());
      try {
        List<Package> _packageList = [];
        _packageList = await AppRepository().package.get();
        print(_packageList.toString());
        emit(PackageLoadSucess(packageList: _packageList));
      } catch (error) {
        emit(PackageLoadFail(message: error.toString()));
      }
    });
    
  }
}
