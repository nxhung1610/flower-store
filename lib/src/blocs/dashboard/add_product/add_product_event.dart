import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductChooseImage extends AddProductEvent {}

class AddProductAddNewProduct extends AddProductEvent {
  final String name;
  final Function(bool)? onComplete;
  final String description;
  final int basePrice;
  AddProductAddNewProduct({
    this.onComplete,
    required this.name,
    required this.description,
    required this.basePrice,
  });
  @override
  List<Object> get props => [name, description, basePrice];
}
