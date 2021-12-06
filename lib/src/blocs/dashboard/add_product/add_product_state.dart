import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class AddProductState extends Equatable {
  final String image;
  final bool loading;
  AddProductState({
    this.image = '',
    required this.loading,
  });

  AddProductState copyWith({
    String? image,
    bool? loading,
  }) {
    return AddProductState(
      image: image ?? this.image,
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'loading': loading,
    };
  }

  factory AddProductState.fromMap(Map<String, dynamic> map) {
    return AddProductState(
      image: map['image'],
      loading: map['loading'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductState.fromJson(String source) =>
      AddProductState.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [image, loading];
}
