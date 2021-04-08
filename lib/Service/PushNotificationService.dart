

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:modul3/Model/Notif.dart';

class PushNotificationService{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  PushNotificationService ();

  Future getToken() async {
    return _firebaseMessaging.getToken();
  }

  void initialise(fungsi) {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        fungsi(Notif(message["data"]["judul"], message["data"]["message"]));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        fungsi(Notif(message["data"]["judul"], message["data"]["message"]));
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
  }
}
