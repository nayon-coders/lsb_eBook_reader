// To parse this JSON data, do
//
//     final getAllBanner = getAllBannerFromJson(jsonString);

import 'dart:convert';

GetAllBanner getAllBannerFromJson(String str) => GetAllBanner.fromJson(json.decode(str));

String getAllBannerToJson(GetAllBanner data) => json.encode(data.toJson());

class GetAllBanner {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAllBanner({
    this.success,
    this.message,
    this.data,
  });

  factory GetAllBanner.fromJson(Map<String, dynamic> json) => GetAllBanner(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? title;
  final String? image;
  final int? categoryId;

  Datum({
    this.id,
    this.title,
    this.image,
    this.categoryId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "category_id": categoryId,
  };
}
