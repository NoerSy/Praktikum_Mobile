
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul3/Model/LOTR/Books.dart';
import 'package:modul3/config/GlobalEndpoint.dart';

class BooksProviders extends ChangeNotifier{
 Books dataBooks;
  Future<int> getBooks() async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";
      final response = await http.get(Uri.parse(booksPath), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(booksFromJson(response.body).docs[0].name);

      dataBooks =  booksFromJson(response.body);
      return response.statusCode;
    } catch (e) {
      print(e);
      return 500;
    }
  }
}