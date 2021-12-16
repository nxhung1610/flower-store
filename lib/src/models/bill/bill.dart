import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'customer.dart';
import 'detail_bill.dart';

class Bill extends Equatable {
  final List<DetailBill>? details;
  final Customer? customer;
  final double? totalPrice;

  const Bill({this.details, this.customer, this.totalPrice});

  factory Bill.fromMap(Map<String, dynamic> data) => Bill(
        details: (data['details'] as List<dynamic>?)
            ?.map((e) => DetailBill.fromMap(e as Map<String, dynamic>))
            .toList(),
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        totalPrice: data['totalPrice'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'details': details?.map((e) => e.toMap()).toList(),
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
    List<DetailBill>? details,
    Customer? customer,
    double? totalPrice,
  }) {
    return Bill(
      details: details ?? this.details,
      customer: customer ?? this.customer,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [details, customer, totalPrice];
}
