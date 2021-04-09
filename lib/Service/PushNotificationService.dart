import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:modul3/Model/Kelas.dart';
import 'package:modul3/Model/Notif.dart';
import 'package:modul3/Model/Scadule.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  PushNotificationService();

  Future getToken() async {
    return _firebaseMessaging.getToken();
  }

  void initialise({@required handlerNotification, handlerScadule}) {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        //print("onMessage: $message \n");
        //print(json.encode(message));
        if (message["data"]["message"] != null) {
          handlerNotification(notifFromJson(json.encode(message)));
        } else if (message['data']['hari'] != null) {
          handlerScadule( scheduleFromJson(json.encode(message)));
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        //print("onResume: $message");
        if (message["data"]["message"] != null) {
          handlerNotification(notifFromJson(json.encode(message)));
        } else if (message['data']['hari'] != null) {
          handlerScadule(scheduleFromJson(json.encode(message)));
        }
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
  }
}
