import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductChooseImage extends AddProductEvent {}
