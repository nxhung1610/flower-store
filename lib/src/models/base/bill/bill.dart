import 'package:equatable/equatable.dart';

import 'detail_bill.dart';
import 'staff.dart';

abstract class Bill extends Equatable {
  final String? id;
  final Staff? staff;
  final List<DetailBill>? details;
  final int? totalPrice;
  final DateTime? createdAt;
  Bill({
    required this.id,
    required this.staff,
    required this.totalPrice,
    required this.details,
    required this.createdAt,
  });
}
