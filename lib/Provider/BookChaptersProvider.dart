import 'package:flutter/cupertino.dart';
import 'package:modul3/Model/LOTR/Chapters.dart';
import 'package:modul3/config/GlobalEndpoint.dart';
import 'package:http/http.dart' as http;

class BookChaptersProvider extends ChangeNotifier{
  Future<Chapters> getChapters({@required String id}) async {
    try {
      String token = "pzIHOHhuTvuSRDULYp92";
      final response = await http.get(Uri.parse(booksPath+'/$id'+chapterSubPath), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      return chaptersFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }
}
