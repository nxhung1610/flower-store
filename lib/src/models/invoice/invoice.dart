import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
import 'package:flower_store/src/models/base/bill/detail_bill.dart';
import 'package:flower_store/src/models/base/bill/staff.dart';
import 'package:flower_store/src/models/user/user_helper.dart';

import 'customer.dart';

class Invoice extends Bill {
  final Customer? customer;
  Invoice({
    String? id,
    Staff? staff,
    required this.customer,
    List<DetailBill>? details = const [],
    int? totalPrice,
    DateTime? createdAt,
  }) : super(
          details: details,
          totalPrice: totalPrice,
          id: id,
          staff: staff,
          createdAt: createdAt,
        );

  factory Invoice.fromMap(Map<String, dynamic> data) => Invoice(
        details: (data['details'] as List<dynamic>?)
            ?.map((e) => DetailBill.fromMap(e as Map<String, dynamic>))
            .toList(),
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        totalPrice: data['totalPrice'] as int?,
        staff: data["staff"] == null ? null : Staff.fromMap(data["staff"]),
        id: data["_id"] as String?,
        createdAt: data["createdAt"] == null
            ? null
            : DateTime.parse(
                data["createdAt"],
              ),
      );

  Map<String, dynamic> toMap() => {
        'details': details?.map((e) => e.toMap()).toList(),
        'customer': customer?.toMap(),
        'totalPrice': totalPrice,
        'staff': staff?.toJson(),
        '_id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Invoice].
  factory Invoice.fromJson(String data) {
    return Invoice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Invoice] to a JSON string.
  String toJson() => json.encode(toMap());

  Invoice copyWith({
    List<DetailBill>? details,
    Customer? customer,
    int? totalPrice,
    Staff? staff,
    String? id,
  }) {
    return Invoice(
      details: details ?? this.details,
      customer: customer ?? this.customer,
      totalPrice: totalPrice ?? this.totalPrice,
      staff: staff ?? this.staff,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [details, customer, totalPrice, staff, id];
}
