// To parse this JSON data, do
//
//     final jadwalKelas = jadwalKelasFromJson(jsonString);

import 'dart:convert';

JadwalKelas jadwalKelasFromJson(String str) => JadwalKelas.fromJson(json.decode(str));

String jadwalKelasToJson(JadwalKelas data) => json.encode(data.toJson());

class JadwalKelas {
  JadwalKelas({
    this.notification,
    this.data,
  });

  Notification notification;
  Data data;

  factory JadwalKelas.fromJson(Map<String, dynamic> json) => JadwalKelas(
    notification: Notification.fromJson(json["notification"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "notification": notification.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.tempat,
    this.jam,
    this.lab,
    this.kelas,
    this.clickAction,
  });

  String tempat;
  String jam;
  String lab;
  String kelas;
  String clickAction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tempat: json["tempat"],
    jam: json["jam"],
    lab: json["lab"],
    kelas: json["kelas"],
    clickAction: json["click_action"],
  );

  Map<String, dynamic> toJson() => {
    "tempat": tempat,
    "jam": jam,
    "lab": lab,
    "kelas": kelas,
    "click_action": clickAction,
  };
}

class Notification {
  Notification({
    this.title,
    this.body,
  });

  String title;
  String body;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
