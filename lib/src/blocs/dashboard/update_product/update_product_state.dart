import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateProductInitState extends UpdateProductState {}

class UpdateProductPickImageInitial extends UpdateProductState {}

class UpdateProductChooseImageSuccess extends UpdateProductState {
  final XFile image;

  UpdateProductChooseImageSuccess({required this.image});
  @override
  // TODO: implement props
  List<Object> get props => [this.image];
}

class UpdateProductChooseImageFail extends UpdateProductState {}
