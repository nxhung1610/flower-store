import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/models/package/package.dart';
import 'package:flower_store/src/models/product.dart';

class PackageState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PackageInitState extends PackageState {}

class PackageLoading extends PackageState {}

class PackageLoadSucess extends PackageState {
  final List<Package> packageList;

  PackageLoadSucess({required this.packageList});

  @override
  List<Object> get props => [packageList];
}

class PackageLoadFail extends PackageState {
  final String message;

  PackageLoadFail({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
