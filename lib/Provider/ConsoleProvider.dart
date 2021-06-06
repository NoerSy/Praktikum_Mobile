import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modul3/config/GlobalEndpoint.dart';
import 'package:modul3/model/SewaConsole/Consoles.dart';
import 'package:http/http.dart' as http;

class ConsoleProvider extends ChangeNotifier {
  Future<Consoles> getConsoles() async {
    var response =
        await http.get(Uri.parse("127.0.0.1:8000/api/v1/consoles/all"), headers: {});

    print("reponse : " + response.body);

    notifyListeners();

    return consolesFromJson(response.body);
  }
}
