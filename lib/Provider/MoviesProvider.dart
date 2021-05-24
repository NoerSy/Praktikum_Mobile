
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul3/Model/LOTR/Movies.dart';
import 'package:modul3/config/GlobalEndpoint.dart';

class MoviesProvider extends ChangeNotifier{

  Future<Movies> getMovies() async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";

      final response = await http.get(Uri.parse("https://the-one-api.dev/v2/movie"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(moviesFromJson(response.body).docs[0].name);

      return moviesFromJson(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Movies> getSpecificMovie({@required String id}) async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";

      final response = await http.get(Uri.parse("https://the-one-api.dev/v2/movie/" + id), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(moviesFromJson(response.body).docs[0].name);

      return moviesFromJson(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}