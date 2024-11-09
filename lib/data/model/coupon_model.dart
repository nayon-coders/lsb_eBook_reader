// To parse this JSON data, do
//
//     final allCoupontList = allCoupontListFromJson(jsonString);

import 'dart:convert';

AllCoupontList allCoupontListFromJson(String str) => AllCoupontList.fromJson(json.decode(str));

String allCoupontListToJson(AllCoupontList data) => json.encode(data.toJson());

class AllCoupontList {
  final bool? success;
  final String? message;
  final List<SingleCoupon>? data;

  AllCoupontList({
    this.success,
    this.message,
    this.data,
  });

  factory AllCoupontList.fromJson(Map<String, dynamic> json) => AllCoupontList(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SingleCoupon>.from(json["data"]!.map((x) => SingleCoupon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleCoupon {
  final int? id;
  final String? code;
  final int? discountPrice;
  final DateTime? expirationDate;
  final int? isActive;

  SingleCoupon({
    this.id,
    this.code,
    this.discountPrice,
    this.expirationDate,
    this.isActive,
  });

  factory SingleCoupon.fromJson(Map<String, dynamic> json) => SingleCoupon(
    id: json["id"],
    code: json["code"],
    discountPrice: json["discount_price"],
    expirationDate: json["expiration_date"] == null ? null : DateTime.parse(json["expiration_date"]),
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "discount_price": discountPrice,
    "expiration_date": expirationDate?.toIso8601String(),
    "is_active": isActive,
  };
}
