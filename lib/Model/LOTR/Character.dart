// To parse this JSON data, do
//
//     final bookCharacters = bookCharactersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BookCharacters bookCharactersFromJson(String str) => BookCharacters.fromJson(json.decode(str));

String bookCharactersToJson(BookCharacters data) => json.encode(data.toJson());

class BookCharacters {
  BookCharacters({
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

  factory BookCharacters.fromJson(Map<String, dynamic> json) => BookCharacters(
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
    @required this.height,
    @required this.race,
    @required this.gender,
    @required this.birth,
    @required this.spouse,
    @required this.death,
    @required this.realm,
    @required this.hair,
    @required this.name,
    @required this.wikiUrl,
  });

  final String id;
  final String height;
  final String race;
  final Gender gender;
  final String birth;
  final String spouse;
  final String death;
  final String realm;
  final String hair;
  final String name;
  final String wikiUrl;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    height: json["height"],
    race: json["race"],
    gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
    birth: json["birth"],
    spouse: json["spouse"],
    death: json["death"],
    realm: json["realm"],
    hair: json["hair"],
    name: json["name"],
    wikiUrl: json["wikiUrl"] == null ? null : json["wikiUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "height": height,
    "race": race,
    "gender": gender == null ? null : genderValues.reverse[gender],
    "birth": birth,
    "spouse": spouse,
    "death": death,
    "realm": realm,
    "hair": hair,
    "name": name,
    "wikiUrl": wikiUrl == null ? null : wikiUrl,
  };
}

enum Gender { FEMALE, MALE, GENDER_MALE, EMPTY, MALES, NA_N, MOST_LIKELY_MALE }

final genderValues = EnumValues({
  "": Gender.EMPTY,
  "Female": Gender.FEMALE,
  "male": Gender.GENDER_MALE,
  "Male": Gender.MALE,
  "Males": Gender.MALES,
  "Most likely male": Gender.MOST_LIKELY_MALE,
  "NaN": Gender.NA_N
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
