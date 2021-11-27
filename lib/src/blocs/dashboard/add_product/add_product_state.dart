import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class AddProductState extends Equatable {
  final String image;
  AddProductState({
    this.image = '',
  });

  AddProductState copyWith({
    String? image,
  }) {
    return AddProductState(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
    };
  }

  factory AddProductState.fromMap(Map<String, dynamic> map) {
    return AddProductState(
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductState.fromJson(String source) =>
      AddProductState.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [image];
}
