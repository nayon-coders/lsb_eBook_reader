
// To parse this JSON data, do
//
//     final shippingAddressModel = shippingAddressModelFromJson(jsonString);

import 'dart:convert';

ShippingAddressModel shippingAddressModelFromJson(String str) => ShippingAddressModel.fromJson(json.decode(str));

String shippingAddressModelToJson(ShippingAddressModel data) => json.encode(data.toJson());

class ShippingAddressModel {
  final bool? success;
  final String? message;
  final List<SingleAddressModel>? data;

  ShippingAddressModel({
    this.success,
    this.message,
    this.data,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) => ShippingAddressModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SingleAddressModel>.from(json["data"]!.map((x) => SingleAddressModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleAddressModel {
  final int? id;
  final int? userId;
  final String? phone;
  final String? contact;
  final String? address;
  final String? addressType;
  final String? city;
  final String? postCode;
  final String? message;
  final String? division;
  final String? district;

  SingleAddressModel({
    this.id,
    this.userId,
    this.phone,
    this.contact,
    this.address,
    this.addressType,
    this.city,
    this.postCode,
    this.message,
    this.division,
    this.district,
  });

  factory SingleAddressModel.fromJson(Map<String, dynamic> json) => SingleAddressModel(
    id: json["id"],
    userId: json["user_id"],
    phone: json["phone"],
    contact: json["contact"],
    address: json["address"],
    addressType: json["address_type"],
    city: json["city"],
    postCode: json["post_code"],
    message: json["message"],
    division: json["division"],
    district: json["district"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "phone": phone,
    "contact": contact,
    "address": address,
    "address_type": addressType,
    "city": city,
    "post_code": postCode,
    "message": message,
    "division": division,
    "district": district,
  };
}
