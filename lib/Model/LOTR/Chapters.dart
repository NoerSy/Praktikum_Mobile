// To parse this JSON data, do
//
//     final chapters = chaptersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Chapters chaptersFromJson(String str) => Chapters.fromJson(json.decode(str));

String chaptersToJson(Chapters data) => json.encode(data.toJson());

class Chapters {
  Chapters({
    @required this.docs,
    @required this.total,
    @required this.limit,
    @required this.offset,
    @required this.page,
    @required this.pages,
  });

  final List<Doc> docs;
  final int total;
  final int limit;
  final int offset;
  final int page;
  final int pages;

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
    total: json["total"],
    limit: json["limit"],
    offset: json["offset"],
    page: json["page"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    "total": total,
    "limit": limit,
    "offset": offset,
    "page": page,
    "pages": pages,
  };
}

class Doc {
  Doc({
    @required this.id,
    @required this.chapterName,
  });

  final String id;
  final String chapterName;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    chapterName: json["chapterName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "chapterName": chapterName,
  };
}
