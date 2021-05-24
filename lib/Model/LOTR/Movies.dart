// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  Movies({
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

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
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
    @required this.runtimeInMinutes,
    @required this.budgetInMillions,
    @required this.boxOfficeRevenueInMillions,
    @required this.academyAwardNominations,
    @required this.academyAwardWins,
    @required this.rottenTomatoesScore,
  });

  final String id;
  final String name;
  final int runtimeInMinutes;
  final int budgetInMillions;
  final double boxOfficeRevenueInMillions;
  final int academyAwardNominations;
  final int academyAwardWins;
  final double rottenTomatoesScore;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    name: json["name"],
    runtimeInMinutes: json["runtimeInMinutes"],
    budgetInMillions: json["budgetInMillions"],
    boxOfficeRevenueInMillions: json["boxOfficeRevenueInMillions"].toDouble(),
    academyAwardNominations: json["academyAwardNominations"],
    academyAwardWins: json["academyAwardWins"],
    rottenTomatoesScore: json["rottenTomatoesScore"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "runtimeInMinutes": runtimeInMinutes,
    "budgetInMillions": budgetInMillions,
    "boxOfficeRevenueInMillions": boxOfficeRevenueInMillions,
    "academyAwardNominations": academyAwardNominations,
    "academyAwardWins": academyAwardWins,
    "rottenTomatoesScore": rottenTomatoesScore,
  };
}
