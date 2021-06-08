import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modul3/config/GlobalEndpoint.dart';
import 'package:modul3/model/SewaConsole/Consoles.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConsoleProvider extends ChangeNotifier {
  Future<Consoles> getConsoles() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String token = pref.getString('auth_token');
    print(token);

    try {
      //final response = await http.get(Uri.http('127.0.0.1:8000', '/api/v1/consoles/all'), headers: {});
      final response = await http.get(Uri.http('192.168.1.9:8000', '/api/v1/consoles/all'), headers : {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });

      print("reponse : " + response.body);

      return consolesFromJson(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
