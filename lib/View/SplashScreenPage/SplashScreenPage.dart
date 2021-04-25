import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modul3/View/DashboardPage/DashboardPage.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:modul3/thame/PaletteColor.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  startTime() async {
    var _duration = new Duration(seconds: 6);
    return Timer(_duration, navigationPage);
  }

  navigationPage() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
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
            child: Image.network(
              "https://img.icons8.com/ultraviolet/100/000000/calculator.png",
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
}

Widget indicatorLoad() {
  return SpinKitFoldingCube(
    size: 45,
    color: PaletteColor.primary,
  );
}
