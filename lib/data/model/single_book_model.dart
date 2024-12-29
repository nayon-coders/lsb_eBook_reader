// To parse this JSON data, do
//
//     final singleBookModel = singleBookModelFromJson(jsonString);

import 'dart:convert';

SingleBookModel singleBookModelFromJson(String str) => SingleBookModel.fromJson(json.decode(str));

String singleBookModelToJson(SingleBookModel data) => json.encode(data.toJson());

class SingleBookModel {
  final bool? success;
  final String? message;
  final BookInfo? data;

  SingleBookModel({
    this.success,
    this.message,
    this.data,
  });

  factory SingleBookModel.fromJson(Map<String, dynamic> json) => SingleBookModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : BookInfo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
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
  final int? mainToc;
  final int? subToc;
  final int? totalRating;
  final double? averageRating;
  final List<Rating>? rating;

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
    this.mainToc,
    this.subToc,
    this.totalRating,
    this.averageRating,
    this.rating,
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
    lastEditionYear: json["last_edition_year"] ,
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
    mainToc: json["main_toc"],
    subToc: json["sub_toc"],
    totalRating: json["total_rating"],
    averageRating: json["average_rating"]?.toDouble(),
    rating: json["rating"] == null ? [] : List<Rating>.from(json["rating"]!.map((x) => Rating.fromJson(x))),
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
    "main_toc": mainToc,
    "sub_toc": subToc,
    "total_rating": totalRating,
    "average_rating": averageRating,
    "rating": rating == null ? [] : List<dynamic>.from(rating!.map((x) => x.toJson())),
  };
}

class Rating {
  final int? id;
  final int? userId;
  final int? bookId;
  final double? rating;
  final String? feedback;

  Rating({
    this.id,
    this.userId,
    this.bookId,
    this.rating,
    this.feedback,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"],
    userId: json["user_id"],
    bookId: json["book_id"],
    rating: json["rating"]?.toDouble(),
    feedback: json["feedback"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "book_id": bookId,
    "rating": rating,
    "feedback": feedback,
  };
}
