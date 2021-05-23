
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul3/Model/LOTR/Books.dart';
import 'package:modul3/config/GlobalEndpoint.dart';

class CharactersProvider extends ChangeNotifier{
  Books dataCharacters;
  Future<int> getCharacters() async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";
      final response = await http.get(Uri.parse(booksPath), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(booksFromJson(response.body).docs[0].name);

      dataCharacters =  booksFromJson(response.body);
      return response.statusCode;
    } catch (e) {
      print(e);
      return 500;
    }
  }
}