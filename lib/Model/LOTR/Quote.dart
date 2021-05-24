// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({
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

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
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
    @required this.dialog,
    @required this.movie,
    @required this.character,
  });

  final String id;
  final String dialog;
  final Movie movie;
  final String character;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    dialog: json["dialog"],
    movie: movieValues.map[json["movie"]],
    character: json["character"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "dialog": dialog,
    "movie": movieValues.reverse[movie],
    "character": character,
  };
}

enum Movie { THE_5_CD95395_DE30_EFF6_EBCCDE5_D, THE_5_CD95395_DE30_EFF6_EBCCDE5_B }

final movieValues = EnumValues({
  "5cd95395de30eff6ebccde5b": Movie.THE_5_CD95395_DE30_EFF6_EBCCDE5_B,
  "5cd95395de30eff6ebccde5d": Movie.THE_5_CD95395_DE30_EFF6_EBCCDE5_D
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
