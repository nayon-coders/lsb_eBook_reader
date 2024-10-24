// To parse this JSON data, do
//
//     final paymentMolde = paymentMoldeFromJson(jsonString);

import 'dart:convert';

PaymentMolde paymentMoldeFromJson(String str) => PaymentMolde.fromJson(json.decode(str));

String paymentMoldeToJson(PaymentMolde data) => json.encode(data.toJson());

class PaymentMolde {
  final bool? success;
  final String? message;
  final List<SinglePaymentMethod>? data;

  PaymentMolde({
    this.success,
    this.message,
    this.data,
  });

  factory PaymentMolde.fromJson(Map<String, dynamic> json) => PaymentMolde(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SinglePaymentMethod>.from(json["data"]!.map((x) => SinglePaymentMethod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SinglePaymentMethod {
  final int? id;
  final String? logoImage;
  final String? methodName;
  final String? acocuntNumber;
  final String? accountType;
  final double? charge;

  SinglePaymentMethod({
    this.id,
    this.logoImage,
    this.methodName,
    this.acocuntNumber,
    this.accountType,
    this.charge,
  });

  factory SinglePaymentMethod.fromJson(Map<String, dynamic> json) => SinglePaymentMethod(
    id: json["id"],
    logoImage: json["logoImage"],
    methodName: json["methodName"],
    acocuntNumber: json["acocuntNumber"],
    accountType: json["accountType"],
    charge: json["charge"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logoImage": logoImage,
    "methodName": methodName,
    "acocuntNumber": acocuntNumber,
    "accountType": accountType,
    "charge": charge,
  };
}
