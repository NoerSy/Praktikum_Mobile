// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
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

  factory Books.fromJson(Map<String, dynamic> json) => Books(
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
    @required this.name,
  });

  final String id;
  final String name;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
