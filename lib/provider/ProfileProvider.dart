

import 'package:flutter/material.dart';
import 'package:modul3/model/SewaConsole/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileProvider extends ChangeNotifier {
  Future<Profile> getMe() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String token = pref.getString('auth_token');

    try {
      //final response = await http.get(Uri.http('127.0.0.1:8000', '/api/v1/consoles/all'), headers: {});
      final response = await http.post(Uri.http('192.168.1.9:8000', '/api/v1/auth/me'), headers : {
        'Authorization': 'Bearer $token'
      });

      print("reponse : " + response.body);

      return profileFromJson(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}