// To parse this JSON data, do
//
//     final getMyOrderModel = getMyOrderModelFromJson(jsonString);

import 'dart:convert';

GetMyOrderModel getMyOrderModelFromJson(String str) => GetMyOrderModel.fromJson(json.decode(str));

String getMyOrderModelToJson(GetMyOrderModel data) => json.encode(data.toJson());

class GetMyOrderModel {
  final bool? success;
  final String? message;
  final UserData? userData;
  final List<OrdersDatum>? ordersData;

  GetMyOrderModel({
    this.success,
    this.message,
    this.userData,
    this.ordersData,
  });

  factory GetMyOrderModel.fromJson(Map<String, dynamic> json) => GetMyOrderModel(
    success: json["success"],
    message: json["message"],
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
    ordersData: json["ordersData"] == null ? [] : List<OrdersDatum>.from(json["ordersData"]!.map((x) => OrdersDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "userData": userData?.toJson(),
    "ordersData": ordersData == null ? [] : List<dynamic>.from(ordersData!.map((x) => x.toJson())),
  };
}

class OrdersDatum {
  final int? id;
  final int? userId;
  final int? bookId;
  final int? price;
  final int? deliveryAddressId;
  final int? deliveryFee;
  final int? quantity;
  final int? totalPrice;
  final String? paymentMethod;
  final String? orderStatus;
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
  final int? totalPages;
  final String? sortDescription;
  final String? dedication;
  final String? authorBio;
  final String? introduction;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final int? totalRatings;
  final double? averageRating;

  OrdersDatum({
    this.id,
    this.userId,
    this.bookId,
    this.price,
    this.deliveryAddressId,
    this.deliveryFee,
    this.quantity,
    this.totalPrice,
    this.paymentMethod,
    this.orderStatus,
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
    this.totalPages,
    this.sortDescription,
    this.dedication,
    this.authorBio,
    this.introduction,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.totalRatings,
    this.averageRating,
  });

  factory OrdersDatum.fromJson(Map<String, dynamic> json) => OrdersDatum(
    id: json["id"],
    userId: json["user_id"],
    bookId: json["book_id"],
    price: json["price"],
    deliveryAddressId: json["delivery_address_id"],
    deliveryFee: json["delivery_fee"],
    quantity: json["quantity"],
    totalPrice: json["total_price"],
    paymentMethod: json["payment_method"],
    orderStatus: json["order_status"],
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
    totalPages: json["total_pages"],
    sortDescription: json["sort_description"],
    dedication: json["dedication"],
    authorBio: json["author_bio"],
    introduction: json["introduction"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    totalRatings: json["total_ratings"],
    averageRating: json["average_rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "book_id": bookId,
    "price": price,
    "delivery_address_id": deliveryAddressId,
    "delivery_fee": deliveryFee,
    "quantity": quantity,
    "total_price": totalPrice,
    "payment_method": paymentMethod,
    "order_status": orderStatus,
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
    "total_pages": totalPages,
    "sort_description": sortDescription,
    "dedication": dedication,
    "author_bio": authorBio,
    "introduction": introduction,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category_id": categoryId,
    "total_ratings": totalRatings,
    "average_rating": averageRating,
  };
}

class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? profilePic;
  final String? address;
  final String? profession;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserData({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.profilePic,
    this.address,
    this.profession,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    profilePic: json["profile_pic"],
    address: json["address"],
    profession: json["profession"],
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
    "address": address,
    "profession": profession,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
