import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:modul3/Model/Notif.dart';
import 'package:modul3/Model/Scadule.dart';
import 'package:modul3/Model/jadwalKelas.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  PushNotificationService();

  Future getToken() async {
    return _firebaseMessaging.getToken();
  }

  void initialise({@required handlerNotification, handlerScadule}) {

    if(Platform.isIOS){
      _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    }

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        //JadwalKelas myData = jadwalKelasFromJson(json.encode(message));

        if (message["data"]["message"] != null) {
          handlerNotification(notifFromJson(json.encode(message)));
        } else if (message['data']['hari'] != null) {
          handlerScadule( scheduleFromJson(json.encode(message)));
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        if (message["data"]["message"] != null) {
          handlerNotification(notifFromJson(json.encode(message)));
        } else if (message['data']['hari'] != null) {
          handlerScadule(scheduleFromJson(json.encode(message)));
        }
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
  }
}
