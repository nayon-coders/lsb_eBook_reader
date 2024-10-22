// To parse this JSON data, do
//
//     final myProfileModel = myProfileModelFromJson(jsonString);

import 'dart:convert';

MyProfileModel myProfileModelFromJson(String str) => MyProfileModel.fromJson(json.decode(str));

String myProfileModelToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? profilePic;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MyProfileModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.profilePic,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    profilePic: json["profile_pic"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "profile_pic": profilePic,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
