import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitState extends AddProductState {}

class AddProductPickImageInitial extends AddProductState {}

class AddProductChooseImageSuccess extends AddProductState {
  final XFile image;

  AddProductChooseImageSuccess({required this.image});
  @override
  // TODO: implement props
  List<Object> get props => [this.image];
}

class AddProductChooseImageFail extends AddProductState {}
