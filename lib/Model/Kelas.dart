// To parse this JSON data, do
//
//     final kelas = kelasFromJson(jsonString);

import 'dart:convert';

Kelas kelasFromJson(String str) => Kelas.fromJson(json.decode(str));

String kelasToJson(Kelas data) => json.encode(data.toJson());

class Kelas {
  Kelas({
    this.nama,
    this.tempat,
    this.jam,
  });

  String nama;
  String tempat;
  String jam;

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
    nama: json["nama"],
    tempat: json["tempat"],
    jam: json["jam"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "tempat": tempat,
    "jam": jam,
  };
}
