import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'customer.dart';
import 'detail_bill.dart';

class Bill extends Equatable {
  final List<DetailBill>? detail;
  final Customer? customer;
  final double? totalPrice;

  const Bill({this.detail, this.customer, this.totalPrice});

  factory Bill.fromMap(Map<String, dynamic> data) => Bill(
        detail: (data['detail'] as List<dynamic>?)
            ?.map((e) => DetailBill.fromMap(e as Map<String, dynamic>))
            .toList(),
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        totalPrice: data['totalPrice'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'detail': detail?.map((e) => e.toMap()).toList(),
        'customer': customer?.toMap(),
        'totalPrice': totalPrice,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Bill].
  factory Bill.fromJson(String data) {
    return Bill.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Bill] to a JSON string.
  String toJson() => json.encode(toMap());

  Bill copyWith({
    List<DetailBill>? detail,
    Customer? customer,
    double? totalPrice,
  }) {
    return Bill(
      detail: detail ?? this.detail,
      customer: customer ?? this.customer,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [detail, customer, totalPrice];
}
