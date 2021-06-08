import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modul3/View/DashboardPage/DashboardPage.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/config/GlobalKeySharedPref.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  navigationPage() async {
    bool temp = await loadPrefFungsion();
    if (!temp)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/imge/icon.png",
              height: 200,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 500,
          ),
          indicatorLoad(),
        ],
      ),
    );
  }

  loadPrefFungsion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool temp = prefs.getBool("is_login") ??  false;
    if (temp) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            fullname: " ",
            username: " ",
          ),
        ),
      );
    }
    return temp;
  }
}
