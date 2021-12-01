import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductState extends Equatable {
  final bool loading;
  final String sId;
  final String image;
  final String name;
  final String description;
  final int basePrice;
  UpdateProductState({
    required this.loading,
    required this.sId,
    required this.image,
    required this.name,
    required this.description,
    required this.basePrice,
  });

  UpdateProductState copyWith({
    bool? loading,
    String? sId,
    String? image,
    String? name,
    String? description,
    int? basePrice,
  }) {
    return UpdateProductState(
      loading: loading ?? this.loading,
      sId: sId ?? this.sId,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loading': loading,
      'sId': sId,
      'image': image,
      'name': name,
      'description': description,
      'basePrice': basePrice,
    };
  }

  factory UpdateProductState.fromMap(Map<String, dynamic> map) {
    return UpdateProductState(
      loading: map['loading'],
      sId: map['sId'],
      image: map['image'],
      name: map['name'],
      description: map['description'],
      basePrice: map['basePrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProductState.fromJson(String source) =>
      UpdateProductState.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      loading,
      sId,
      image,
      name,
      description,
      basePrice,
    ];
  }
}
