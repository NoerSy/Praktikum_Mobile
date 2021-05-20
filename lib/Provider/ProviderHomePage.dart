import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modul3/Model/UnSplashModel/ModelImages.dart';

class ProviderHomePage extends ChangeNotifier {
  static final _key = "Client-ID MwejgIiPWDV8gXCSEfoWNhVUu08hVI-EqCDgZ4d5SMA";
  List<ModelImages> dataHomePage;
  Future<int> getDataImages() async {
    try {
      Uri url = Uri.parse('https://api.unsplash.com/photos');

      var client = new Client();
      final response = await client.get(url, headers: {
        "Content-Type": "application/json",
        "Accept-Version": "v1",
        "Authorization": _key,
      });

      dataHomePage = modelImagesFromJson(response.body);

      return response.statusCode;
    } on TimeoutException catch (_) {
      return 501;
    } on SocketException catch (_) {
      return 501;
    }
  }
}
