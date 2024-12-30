// To parse this JSON data, do
//
//     final allBooksModel = allBooksModelFromJson(jsonString);

import 'dart:convert';

AllBooksModel allBooksModelFromJson(String str) => AllBooksModel.fromJson(json.decode(str));

String allBooksModelToJson(AllBooksModel data) => json.encode(data.toJson());

class AllBooksModel {
  final bool? success;
  final String? message;
  final int? totalBooks;
  final List<SingleBookList>? data;

  AllBooksModel({
    this.success,
    this.message,
    this.totalBooks,
    this.data,
  });

  factory AllBooksModel.fromJson(Map<String, dynamic> json) => AllBooksModel(
    success: json["success"],
    message: json["message"],
    totalBooks: json["totalBooks"],
    data: json["data"] == null ? [] : List<SingleBookList>.from(json["data"]!.map((x) => SingleBookList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalBooks": totalBooks,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleBookList {
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
  final int? salePrice;
  final int? totalPages;
  final String? sortDescription;
  final String? dedication;
  final String? authorBio;
  final String? introduction;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final String? categoryName;
  final int? totalRatings;
  final double? averageRating;

  SingleBookList({
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
    this.salePrice,
    this.totalPages,
    this.sortDescription,
    this.dedication,
    this.authorBio,
    this.introduction,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.categoryName,
    this.totalRatings,
    this.averageRating,
  });

  factory SingleBookList.fromJson(Map<String, dynamic> json) => SingleBookList(
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
    salePrice: json["sell_price"],
    totalPages: json["total_pages"],
    sortDescription: json["sort_description"],
    dedication: json["dedication"],
    authorBio: json["author_bio"],
    introduction: json["introduction"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    totalRatings: json["total_ratings"],
    averageRating: json["average_rating"]?.toDouble(),
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
    "total_ratings": totalRatings,
    "average_rating": averageRating,
  };
}
