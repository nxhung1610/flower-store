import 'dart:convert';

import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String? name;
  final String? phone;
  final String? email;

  const Customer({this.name, this.phone, this.email});

  factory Customer.fromMap(Map<String, dynamic> data) => Customer(
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'phone': phone,
        'email': email,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Customer].
  factory Customer.fromJson(String data) {
    return Customer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Customer] to a JSON string.
  String toJson() => json.encode(toMap());

  Customer copyWith({
    String? name,
    String? phone,
    String? email,
  }) {
    return Customer(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [name, phone, email];
}
