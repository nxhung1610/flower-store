import 'package:equatable/equatable.dart';
import 'package:flower_store/src/blocs/dashboard/home/home_helper.dart';
import 'package:flower_store/src/models/product.dart';

class PackageState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PackageInitState extends PackageState {}

class PackageLoadSucess extends PackageState {
  final List<Product> productList;

  PackageLoadSucess({required this.productList});

  @override
  List<Object> get props => [productList];
}
