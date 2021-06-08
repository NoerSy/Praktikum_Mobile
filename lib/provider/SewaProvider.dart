import 'package:flutter/material.dart';
import 'package:modul3/model/SewaConsole/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SewaProvider extends ChangeNotifier {
  static Future<int> postPesanan(
      {@required int id,
      @required String startAt,
      @required String endAt}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();


    try {
      //final response = await http.get(Uri.http('127.0.0.1:8000', '/api/v1/consoles/all'), headers: {});
      final response = await http
          .post(Uri.http('192.168.1.9:8000', '/api/v1/pesanan/new'), body: {
        "sewa_at": "$startAt",
        "back_at": "$endAt",
        "console_id": "$id",
        "Authorization": "Bearer " + pref.getString('auth_token'),
      });

      print({
        "sewa_at": "$startAt",
        "back_at": "$endAt",
        "console_id": "$id",
        "Authorization": "Bearer " + pref.getString('auth_token'),
      });

      print("reponse : " + response.body + '\n');

      return 200;
    } catch (e) {
      print(e);
      return 400;
    }
  }
}
