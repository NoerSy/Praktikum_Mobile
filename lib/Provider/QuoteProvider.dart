
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul3/Model/LOTR/Character.dart';
import 'package:modul3/Model/LOTR/Quote.dart';
import 'package:modul3/config/GlobalEndpoint.dart';

class QuoteProvider extends ChangeNotifier{

  Future<Quote> getQuotes() async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";

      final response = await http.get(Uri.parse("https://the-one-api.dev/v2/quote"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(bookCharactersFromJson(response.body).docs[0].name);

      return quoteFromJson(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}