import 'package:flutter/scheduler.dart';

enum FormStatus {
  FillForm,
  Loading,
  Error,
  Success,
}

enum RoleType {
  Warehouse,
  Accountant,
  Seller,
  Manager,
  Supplier,
}

enum RequestStatus {
  Pending,
  Done,
  Cancel,
  Unknown,
}

extension RequestExtension on RequestStatus {
  static RequestStatus getValue(int index) {
    switch (index) {
      case 1:
        return RequestStatus.Pending;
      case 2:
        return RequestStatus.Done;
      case 3:
        return RequestStatus.Cancel;
      default:
        return RequestStatus.Unknown;
    }
  }

  void talk() {
    print('meow');
  }
}
