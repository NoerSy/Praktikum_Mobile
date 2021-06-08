// To parse this JSON data, do
//
//     final consoles = consolesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Consoles consolesFromJson(String str) => Consoles.fromJson(json.decode(str));

String consolesToJson(Consoles data) => json.encode(data.toJson());

class Consoles {
  Consoles({
    @required this.total,
    @required this.messages,
    @required this.data,
  });

  final int total;
  final String messages;
  final List<Datum> data;

  factory Consoles.fromJson(Map<String, dynamic> json) => Consoles(
    total: json["total"],
    messages: json["messages"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "messages": messages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    @required this.id,
    @required this.merek,
    @required this.type,
    @required this.isSewa,
    @required this.description,
    @required this.deletedAt,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.image,
  });

  final int id;
  final String merek;
  final String type;
  final int isSewa;
  final String description;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    merek: json["merek"],
    type: json["type"],
    isSewa: json["isSewa"],
    description: json["description"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "merek": merek,
    "type": type,
    "isSewa": isSewa,
    "description": description,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
  };
}
