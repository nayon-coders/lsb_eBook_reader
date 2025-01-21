// To parse this JSON data, do
//
//     final localDBbookModel = localDBbookModelFromJson(jsonString);

import 'dart:convert';

LocalDBbookModel localDBbookModelFromJson(String str) => LocalDBbookModel.fromJson(json.decode(str));

String localDBbookModelToJson(LocalDBbookModel data) => json.encode(data.toJson());

class LocalDBbookModel {
  final MyBook? book;
  final List<MainTopic>? mainTopic;

  LocalDBbookModel({
    this.book,
    this.mainTopic,
  });

  factory LocalDBbookModel.fromJson(Map<String, dynamic> json) => LocalDBbookModel(
    book: json["book"] == null ? null : MyBook.fromJson(json["book"]),
    mainTopic: json["main_topic"] == null ? [] : List<MainTopic>.from(json["main_topic"]!.map((x) => MainTopic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "book": book?.toJson(),
    "main_topic": mainTopic == null ? [] : List<dynamic>.from(mainTopic!.map((x) => x.toJson())),
  };
}

class MyBook {
  final String? bookName;
  final String? image;
  final String? bookId;

  MyBook({
    this.bookName,
    this.image,
    this.bookId,
  });

  factory MyBook.fromJson(Map<String, dynamic> json) => MyBook(
    bookName: json["book_name"],
    image: json["image"],
    bookId: json["book_id"],
  );

  Map<String, dynamic> toJson() => {
    "book_name": bookName,
    "image": image,
    "book_id": bookId,
  };
}

class MainTopic {
  final String? name;
  final String? bookId;
  final int? pageNumber;
  final List<SubTopics>? subTocs;

  MainTopic({
    this.name,
    this.bookId,
    this.pageNumber,
    this.subTocs,
  });

  factory MainTopic.fromJson(Map<String, dynamic> json) => MainTopic(
    name: json["name"],
    bookId: json["book_id"],
    pageNumber: json["page_number"],
    subTocs: json["sub_tocs"] == null ? [] : List<SubTopics>.from(json["sub_tocs"]!.map((x) => SubTopics.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "book_id": bookId,
    "page_number": pageNumber,
    "sub_tocs": subTocs == null ? [] : List<dynamic>.from(subTocs!.map((x) => x.toJson())),
  };
}

class SubTopics {
  final int? mainTocId;
  final String? name;
  final int? pageNumber;
  final Content? content;

  SubTopics({
    this.mainTocId,
    this.name,
    this.pageNumber,
    this.content,
  });

  factory SubTopics.fromJson(Map<String, dynamic> json) => SubTopics(
    mainTocId: json["main_toc_id"],
    name: json["name"],
    pageNumber: json["page_number"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "main_toc_id": mainTocId,
    "name": name,
    "page_number": pageNumber,
    "content": content?.toJson(),
  };
}

class Content {
  final String? content;
  final String? totalPage;
  final List<MarkTextDatum>? markTextData;

  Content({
    this.content,
    this.totalPage,
    this.markTextData,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    content: json["content"],
    totalPage: json["total_page"],
    markTextData: json["markTextData"] == null ? [] : List<MarkTextDatum>.from(json["markTextData"]!.map((x) => MarkTextDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "total_page": totalPage,
    "markTextData": markTextData == null ? [] : List<dynamic>.from(markTextData!.map((x) => x.toJson())),
  };
}

class MarkTextDatum {
  final String? text;
  final String? definition;

  MarkTextDatum({
    this.text,
    this.definition,
  });

  factory MarkTextDatum.fromJson(Map<String, dynamic> json) => MarkTextDatum(
    text: json["text"],
    definition: json["definition"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "definition": definition,
  };
}
