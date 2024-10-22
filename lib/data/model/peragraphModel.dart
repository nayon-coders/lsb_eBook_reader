// To parse this JSON data, do
//
//     final peragraphModel = peragraphModelFromJson(jsonString);

import 'dart:convert';

PeragraphModel peragraphModelFromJson(String str) => PeragraphModel.fromJson(json.decode(str));

String peragraphModelToJson(PeragraphModel data) => json.encode(data.toJson());

class PeragraphModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;
  final List<MarkTextDatum>? markTextData;

  PeragraphModel({
    this.success,
    this.message,
    this.data,
    this.markTextData,
  });

  factory PeragraphModel.fromJson(Map<String, dynamic> json) => PeragraphModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    markTextData: json["markTextData"] == null ? [] : List<MarkTextDatum>.from(json["markTextData"]!.map((x) => MarkTextDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "markTextData": markTextData == null ? [] : List<dynamic>.from(markTextData!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? paraId;
  final int? bookId;
  final int? mainTocId;
  final int? subTocId;
  final String? content;
  final int? pageNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.paraId,
    this.bookId,
    this.mainTocId,
    this.subTocId,
    this.content,
    this.pageNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    paraId: json["para_id"],
    bookId: json["book_id"],
    mainTocId: json["main_toc_id"],
    subTocId: json["sub_toc_id"],
    content: json["content"],
    pageNumber: json["page_number"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "para_id": paraId,
    "book_id": bookId,
    "main_toc_id": mainTocId,
    "sub_toc_id": subTocId,
    "content": content,
    "page_number": pageNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class MarkTextDatum {
  final int? id;
  final int? paraId;
  final String? text;
  final String? definition;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MarkTextDatum({
    this.id,
    this.paraId,
    this.text,
    this.definition,
    this.createdAt,
    this.updatedAt,
  });

  factory MarkTextDatum.fromJson(Map<String, dynamic> json) => MarkTextDatum(
    id: json["id"],
    paraId: json["para_id"],
    text: json["text"],
    definition: json["definition"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "para_id": paraId,
    "text": text,
    "definition": definition,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
