

import 'package:flutter/material.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout({@required BuildContext ctx}) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();

  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}