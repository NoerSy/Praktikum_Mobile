// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    @required this.id,
    @required this.name,
    @required this.role,
    @required this.email,
    @required this.deletedAt,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.image,
  });

  final int id;
  final String name;
  final int role;
  final String email;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "email": email,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
  };
}
