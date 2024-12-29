// To parse this JSON data, do
//
//     final allCoupontList = allCoupontListFromJson(jsonString);

import 'dart:convert';

AllCoupontList allCoupontListFromJson(String str) => AllCoupontList.fromJson(json.decode(str));

String allCoupontListToJson(AllCoupontList data) => json.encode(data.toJson());

class AllCoupontList {
  final bool? success;
  final String? message;
  final int? totalCoupon;
  final List<SingleCoupon>? data;

  AllCoupontList({
    this.success,
    this.message,
    this.totalCoupon,
    this.data,
  });

  factory AllCoupontList.fromJson(Map<String, dynamic> json) => AllCoupontList(
    success: json["success"],
    message: json["message"],
    totalCoupon: json["totalCoupon"],
    data: json["data"] == null ? [] : List<SingleCoupon>.from(json["data"]!.map((x) => SingleCoupon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalCoupon": totalCoupon,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleCoupon {
  final int? id;
  final String? code;
  final int? discountPrice;
  final DateTime? expirationDate;
  final int? isActive;
  final DateTime? createAt;
  final DateTime? updatedAt;
  final List<int>? bookListForCoupons;

  SingleCoupon({
    this.id,
    this.code,
    this.discountPrice,
    this.expirationDate,
    this.isActive,
    this.createAt,
    this.updatedAt,
    this.bookListForCoupons,
  });

  factory SingleCoupon.fromJson(Map<String, dynamic> json) => SingleCoupon(
    id: json["id"],
    code: json["code"],
    discountPrice: json["discount_price"],
    expirationDate: json["expiration_date"] == null ? null : DateTime.parse(json["expiration_date"]),
    isActive: json["is_active"],
    createAt: json["create_at"] == null ? null : DateTime.parse(json["create_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    bookListForCoupons: json["book_list_for_coupons"] == null ? [] : List<int>.from(json["book_list_for_coupons"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "discount_price": discountPrice,
    "expiration_date": expirationDate?.toIso8601String(),
    "is_active": isActive,
    "create_at": createAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "book_list_for_coupons": bookListForCoupons == null ? [] : List<dynamic>.from(bookListForCoupons!.map((x) => x)),
  };
}
