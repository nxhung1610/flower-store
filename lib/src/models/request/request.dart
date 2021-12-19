import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/base/bill/detail_bill.dart';
import 'package:flower_store/src/models/base/bill/staff.dart';

class Request extends Bill {
  final bool? approve;
  final int? status;

  Request({
    String? id,
    Staff? staff,
    List<DetailBill>? details = const [],
    this.approve = false,
    this.status,
    int? totalPrice = 0,
    DateTime? createdAt,
  }) : super(
          id: id,
          staff: staff,
          details: details,
          totalPrice: totalPrice,
          createdAt: createdAt,
        );

  factory Request.fromMap(Map<String, dynamic> data) => Request(
        id: data['_id'] as String?,
        staff: data['staff'] == null
            ? null
            : Staff.fromMap(data['staff'] as Map<String, dynamic>),
        details: (data['details'] as List<dynamic>?)
            ?.map((e) => DetailBill.fromMap(e as Map<String, dynamic>))
            .toList(),
        approve: data['approve'] as bool?,
        status: data['status'] as int?,
        totalPrice: data['totalPrice'] as int?,
        createdAt: data["createdAt"] == null
            ? null
            : DateTime.parse(
                data["createdAt"],
              ),
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'staff': staff?.toMap(),
        'details': details?.map((e) => e.toMap()).toList(),
        'approve': approve,
        'status': status,
        'totalPrice': totalPrice,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Request].
  factory Request.fromJson(String data) {
    return Request.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Request] to a JSON string.
  String toJson() => json.encode(toMap());

  Request copyWith({
    String? id,
    Staff? staff,
    List<DetailBill>? details,
    bool? approve,
    int? status,
    int? totalPrice,
    DateTime? createdAt,
  }) {
    return Request(
      id: id ?? this.id,
      staff: staff ?? this.staff,
      details: details ?? this.details,
      approve: approve ?? this.approve,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      staff,
      details,
      approve,
      status,
      totalPrice,
    ];
  }
}
