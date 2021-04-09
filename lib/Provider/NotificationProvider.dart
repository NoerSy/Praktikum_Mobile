import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modul3/Model/Notif.dart';

class NotificationProvider extends ChangeNotifier {
  static final _key = "key=AAAAxOkwZss:APA91bFuLbT5A0RsgPeuUbEYvRgSuyjqbLQouh65gD_H6xWTCgX_ixnucZJQ5IfiZHQEpusdBTgVwNhxNfw2Qx4c208LnQ2TRvcXNtEM5Z545KghF9bsV-ONgCk58qj3dXSjg9bLTV-s";

  static Future<bool> sendFcmMessage(String judul, String message, {String token}) async {
    try {
      Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      var header = {
        "Content-Type": "application/json",
        "Authorization": _key,
      };
      var request = {
        "notification": {
          "title": judul,
          "body": message
        },
        "data": {
          "judul": judul,
          "message": message,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        },
        "to": token,
      };

      var client = new Client();
      var response = await client.post(url, headers: header, body: json.encode(request));
      return true;
    } catch (e, s) {
      print(e);
      return false;
    }
  }

}
