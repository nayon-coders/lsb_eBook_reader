// To parse this JSON data, do
//
//     final bookTocisModel = bookTocisModelFromJson(jsonString);

import 'dart:convert';

BookTocisModel bookTocisModelFromJson(String str) => BookTocisModel.fromJson(json.decode(str));

String bookTocisModelToJson(BookTocisModel data) => json.encode(data.toJson());

class BookTocisModel {
  final bool? success;
  final String? message;
  final BookInfo? bookInfo;
  final int? totalMainTocs;
  final List<Datum>? data;

  BookTocisModel({
    this.success,
    this.message,
    this.bookInfo,
    this.totalMainTocs,
    this.data,
  });

  factory BookTocisModel.fromJson(Map<String, dynamic> json) => BookTocisModel(
    success: json["success"],
    message: json["message"],
    bookInfo: json["bookInfo"] == null ? null : BookInfo.fromJson(json["bookInfo"]),
    totalMainTocs: json["totalMainTocs"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "bookInfo": bookInfo?.toJson(),
    "totalMainTocs": totalMainTocs,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class BookInfo {
  final int? bookId;
  final String? bookName;
  final String? author;
  final String? title;
  final dynamic publisher;
  final dynamic publicationYear;
  final dynamic firstEditionYear;
  final dynamic lastEditionYear;
  final dynamic publisherName;
  final dynamic price;
  final dynamic dedication;
  final dynamic authorBio;
  final dynamic introduction;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;

  BookInfo({
    this.bookId,
    this.bookName,
    this.author,
    this.title,
    this.publisher,
    this.publicationYear,
    this.firstEditionYear,
    this.lastEditionYear,
    this.publisherName,
    this.price,
    this.dedication,
    this.authorBio,
    this.introduction,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) => BookInfo(
    bookId: json["book_id"],
    bookName: json["book_name"],
    author: json["author"],
    title: json["title"],
    publisher: json["publisher"],
    publicationYear: json["publication_year"],
    firstEditionYear: json["first_edition_year"],
    lastEditionYear: json["last_edition_year"],
    publisherName: json["publisher_name"],
    price: json["price"],
    dedication: json["dedication"],
    authorBio: json["author_bio"],
    introduction: json["introduction"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "book_name": bookName,
    "author": author,
    "title": title,
    "publisher": publisher,
    "publication_year": publicationYear,
    "first_edition_year": firstEditionYear,
    "last_edition_year": lastEditionYear,
    "publisher_name": publisherName,
    "price": price,
    "dedication": dedication,
    "author_bio": authorBio,
    "introduction": introduction,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? bookId;
  final int? pageNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<SubToc>? subTocs;

  Datum({
    this.id,
    this.name,
    this.bookId,
    this.pageNumber,
    this.createdAt,
    this.updatedAt,
    this.subTocs,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    bookId: json["book_id"],
    pageNumber: json["page_number"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    subTocs: json["sub_tocs"] == null ? [] : List<SubToc>.from(json["sub_tocs"]!.map((x) => SubToc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "book_id": bookId,
    "page_number": pageNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "sub_tocs": subTocs == null ? [] : List<dynamic>.from(subTocs!.map((x) => x.toJson())),
  };
}

class SubToc {
  final int? id;
  final int? mainTocId;
  final String? name;
  final int? pageNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SubToc({
    this.id,
    this.mainTocId,
    this.name,
    this.pageNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory SubToc.fromJson(Map<String, dynamic> json) => SubToc(
    id: json["id"],
    mainTocId: json["main_toc_id"],
    name: json["name"],
    pageNumber: json["page_number"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main_toc_id": mainTocId,
    "name": name,
    "page_number": pageNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
