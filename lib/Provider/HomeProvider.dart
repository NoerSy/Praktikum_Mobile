

import 'dart:convert';

import 'package:http/http.dart';

class HomeProvider{
  static final _key = "Client-ID MwejgIiPWDV8gXCSEfoWNhVUu08hVI-EqCDgZ4d5SMA";

  static Future<bool> sendFcmMessage(String judul, String message, {String token}) async {
    try {
      Uri url = Uri.parse('https://api.unsplash.com/photos');
      var header = {
        "Content-Type": "application/json",
        "Accept-Version" : "v1",
        "Authorization": _key,
      };
      var request = {

      };

      var client = new Client();
      var response = await client.post(url, headers: header, body: json.encode(request));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}