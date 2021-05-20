// To parse this JSON data, do
//
//     final notif = notifFromJson(jsonString);

import 'dart:convert';

Notif notifFromJson(String str) => Notif.fromJson(json.decode(str));

String notifToJson(Notif data) => json.encode(data.toJson());

class Notif {
  Notif({
    this.notification,
    this.data,
  });

  Notification notification;
  Data data;

  factory Notif.fromJson(Map<String, dynamic> json) => Notif(
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
    this.judul,
    this.clickAction,
    this.message,
  });

  String judul;
  String clickAction;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    judul: json["judul"],
    clickAction: json["click_action"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "judul": judul,
    "click_action": clickAction,
    "message": message,
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
