import 'dart:convert';

import 'package:equatable/equatable.dart';

class Staff extends Equatable {
  final String? id;
  final String? name;
  final String? url;

  const Staff({this.id, this.name, this.url});

  factory Staff.fromMap(Map<String, dynamic> data) => Staff(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Staff].
  factory Staff.fromJson(String data) {
    return Staff.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Staff] to a JSON string.
  String toJson() => json.encode(toMap());

  Staff copyWith({
    String? id,
    String? name,
    String? url,
  }) {
    return Staff(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, url];
}
