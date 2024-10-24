// To parse this JSON data, do
//
//     final marktextFavModel = marktextFavModelFromJson(jsonString);

import 'dart:convert';

MarktextFavModel marktextFavModelFromJson(String str) => MarktextFavModel.fromJson(json.decode(str));

String marktextFavModelToJson(MarktextFavModel data) => json.encode(data.toJson());

class MarktextFavModel {
  final bool? success;
  final String? message;
  final int? userId;
  final String? userName;
  final String? userEmail;
  final List<SingleMarkTextModel>? data;

  MarktextFavModel({
    this.success,
    this.message,
    this.userId,
    this.userName,
    this.userEmail,
    this.data,
  });

  factory MarktextFavModel.fromJson(Map<String, dynamic> json) => MarktextFavModel(
    success: json["success"],
    message: json["message"],
    userId: json["userID"],
    userName: json["userName"],
    userEmail: json["userEmail"],
    data: json["data"] == null ? [] : List<SingleMarkTextModel>.from(json["data"]!.map((x) => SingleMarkTextModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "userID": userId,
    "userName": userName,
    "userEmail": userEmail,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleMarkTextModel {
  final int? id;
  final int? userId;
  final int? markTextId;
  final int? paraId;
  final String? text;
  final String? definition;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SingleMarkTextModel({
    this.id,
    this.userId,
    this.markTextId,
    this.paraId,
    this.text,
    this.definition,
    this.createdAt,
    this.updatedAt,
  });

  factory SingleMarkTextModel.fromJson(Map<String, dynamic> json) => SingleMarkTextModel(
    id: json["id"],
    userId: json["user_id"],
    markTextId: json["mark_text_id"],
    paraId: json["para_id"],
    text: json["text"],
    definition: json["definition"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "mark_text_id": markTextId,
    "para_id": paraId,
    "text": text,
    "definition": definition,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
