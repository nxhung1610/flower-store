part of 'add_account_bloc.dart';

abstract class AddAccountState extends Equatable {
  const AddAccountState();

  @override
  List<Object> get props => [];
}

class AddAccountInitial extends AddAccountState {}

class AddAccountChoosingImage extends AddAccountState {
  final bool isChoosing;

  AddAccountChoosingImage({this.isChoosing = false});
  @override
  // TODO: implement props
  List<Object> get props => [isChoosing];
}

class AddAccountChooseImageSuccess extends AddAccountState {
  final String image;

  AddAccountChooseImageSuccess({required this.image});
  @override
  // TODO: implement props
  List<Object> get props => [image];
}

class AddAccountChooseImageFailed extends AddAccountState {}
