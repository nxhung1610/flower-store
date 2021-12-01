import 'package:equatable/equatable.dart';

class UpdateProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateProductChooseImage extends UpdateProductEvent {}

class UpdateProductUpdateProduct extends UpdateProductEvent {
  final String name;
  final Function(bool)? onComplete;
  final String description;
  final int basePrice;
  UpdateProductUpdateProduct({
    this.onComplete,
    required this.name,
    required this.description,
    required this.basePrice,
  });
  @override
  List<Object> get props => [name, description, basePrice];
}

class UpdateProductDelete extends UpdateProductEvent {
  final Function(bool)? onComplete;
  UpdateProductDelete({
    this.onComplete,
  });
}
