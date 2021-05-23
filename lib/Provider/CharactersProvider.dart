
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul3/Model/LOTR/Character.dart';
import 'package:modul3/config/GlobalEndpoint.dart';

class CharactersProvider extends ChangeNotifier{

  Future<BookCharacters> getCharacters() async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";

      final response = await http.get(Uri.parse(chractersPath), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(bookCharactersFromJson(response.body).docs[0].name);

      return bookCharactersFromJson(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}