import 'package:flutter/material.dart';
import 'package:modul3/Provider/NotificationProvider.dart';

class AddNotification {
  final TextEditingController _judul = new TextEditingController();
  final TextEditingController _message = new TextEditingController();
  void addNotificationPopUp({context, token}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("New Notification")),
            content: Container(
              height: 170,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "Judul"),
                    controller: _judul,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Body"),
                    controller: _message,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Container(
                      color: Colors.white38,
                      child: TextButton(
                        onPressed: () {
                          NotificationProvider.sendFcmMessage(_judul.text, _message.text, token: token);
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Confirm"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
