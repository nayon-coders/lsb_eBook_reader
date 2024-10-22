// To parse this JSON data, do
//
//     final chapterTopicModel = chapterTopicModelFromJson(jsonString);

import 'dart:convert';

ChapterTopicModel chapterTopicModelFromJson(String str) => ChapterTopicModel.fromJson(json.decode(str));

String chapterTopicModelToJson(ChapterTopicModel data) => json.encode(data.toJson());

class ChapterTopicModel {
  final bool? success;
  final String? message;
  final BookInfo? bookInfo;
  final int? totalMainTocs;
  final List<ChapterTopicsDatum>? data;

  ChapterTopicModel({
    this.success,
    this.message,
    this.bookInfo,
    this.totalMainTocs,
    this.data,
  });

  factory ChapterTopicModel.fromJson(Map<String, dynamic> json) => ChapterTopicModel(
    success: json["success"],
    message: json["message"],
    bookInfo: json["bookInfo"] == null ? null : BookInfo.fromJson(json["bookInfo"]),
    totalMainTocs: json["totalMainTocs"],
    data: json["data"] == null ? [] : List<ChapterTopicsDatum>.from(json["data"]!.map((x) => ChapterTopicsDatum.fromJson(x))),
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
  final String? image;
  final String? author;
  final String? title;
  final String? language;
  final String? publisher;
  final String? publicationYear;
  final String? firstEditionYear;
  final String? lastEditionYear;
  final String? publisherName;
  final String? freeOrPaid;
  final int? price;
  final int? totalPages;
  final String? sortDescription;
  final String? dedication;
  final String? authorBio;
  final String? introduction;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final String? categoryName;

  BookInfo({
    this.bookId,
    this.bookName,
    this.image,
    this.author,
    this.title,
    this.language,
    this.publisher,
    this.publicationYear,
    this.firstEditionYear,
    this.lastEditionYear,
    this.publisherName,
    this.freeOrPaid,
    this.price,
    this.totalPages,
    this.sortDescription,
    this.dedication,
    this.authorBio,
    this.introduction,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.categoryName,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) => BookInfo(
    bookId: json["book_id"],
    bookName: json["book_name"],
    image: json["image"],
    author: json["author"],
    title: json["title"],
    language: json["language"],
    publisher: json["publisher"],
    publicationYear: json["publication_year"],
    firstEditionYear: json["first_edition_year"],
    lastEditionYear: json["last_edition_year"],
    publisherName: json["publisher_name"],
    freeOrPaid: json["free_or_paid"],
    price: json["price"],
    totalPages: json["total_pages"],
    sortDescription: json["sort_description"],
    dedication: json["dedication"],
    authorBio: json["author_bio"],
    introduction: json["introduction"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "book_name": bookName,
    "image": image,
    "author": author,
    "title": title,
    "language": language,
    "publisher": publisher,
    "publication_year": publicationYear,
    "first_edition_year": firstEditionYear,
    "last_edition_year": lastEditionYear,
    "publisher_name": publisherName,
    "free_or_paid": freeOrPaid,
    "price": price,
    "total_pages": totalPages,
    "sort_description": sortDescription,
    "dedication": dedication,
    "author_bio": authorBio,
    "introduction": introduction,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category_id": categoryId,
    "category_name": categoryName,
  };
}

class ChapterTopicsDatum {
  final int? id;
  final String? name;
  final String? bookId;
  final int? pageNumber;
  final String? lookStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ChapterTopicsDatum>? subTocs;
  final int? mainTocId;
  final int? isParagraph;

  ChapterTopicsDatum({
    this.id,
    this.name,
    this.bookId,
    this.pageNumber,
    this.lookStatus,
    this.createdAt,
    this.updatedAt,
    this.subTocs,
    this.mainTocId,
    this.isParagraph,
  });

  factory ChapterTopicsDatum.fromJson(Map<String, dynamic> json) => ChapterTopicsDatum(
    id: json["id"],
    name: json["name"],
    bookId: json["book_id"],
    pageNumber: json["page_number"],
    lookStatus: json["look_status"]!,
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    subTocs: json["sub_tocs"] == null ? [] : List<ChapterTopicsDatum>.from(json["sub_tocs"]!.map((x) => ChapterTopicsDatum.fromJson(x))),
    mainTocId: json["main_toc_id"],
    isParagraph: json["is_paragraph"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "book_id": bookId,
    "page_number": pageNumber,
    "look_status": lookStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "sub_tocs": subTocs == null ? [] : List<dynamic>.from(subTocs!.map((x) => x.toJson())),
    "main_toc_id": mainTocId,
    "is_paragraph": isParagraph,
  };
}



class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
