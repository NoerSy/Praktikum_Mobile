// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    this.notification,
    this.data,
  });

  Notification notification;
  Data data;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
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
    this.hari,
    this.kelas,
    this.clickAction,
  });

  String tempat;
  String jam;
  String hari;
  String kelas;
  String clickAction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tempat: json["tempat"],
    jam: json["jam"],
    hari: json["hari"],
    kelas: json["kelas"],
    clickAction: json["click_action"],
  );

  Map<String, dynamic> toJson() => {
    "tempat": tempat,
    "jam": jam,
    "hari": hari,
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
