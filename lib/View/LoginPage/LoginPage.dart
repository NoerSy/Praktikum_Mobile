import 'package:flutter/material.dart';
import 'package:modul3/Data/dataAssisten.dart';
import 'package:modul3/View/DashboardPage/DashboardPage.dart';
import 'package:modul3/View/SplashScreenPage/SplashScreenPage.dart';
import 'package:modul3/config/GlobalKeySharedPref.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/ButtonLogin.dart';
import 'component/MainForms.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nimFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  bool isLoading = false;

  @override
  initState() {
    loadPrefFungsion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = isLoading
        ? Container(
            color: Colors.black26,
            width: double.infinity,
            height: double.infinity,
            child: indicatorLoad(),
          )
        : Container();

    return Scaffold(
      backgroundColor: PaletteColor.primarybg,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          'https://img.icons8.com/ultraviolet/100/000000/calculator.png',
                          width: 130,
                        ),
                      ),
                      MainForms(
                        nimFilter: _nimFilter,
                        passwordFilter: _passwordFilter,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot password?",
                            style: TypographyStyle.caption2.merge(
                              TextStyle(
                                color: PaletteColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ButtonLogin(
                        onPressedFunction,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Align(
            child: loadingIndicator,
            alignment: FractionalOffset.center,
          ),
        ],
      ),
    );
  }

  loadPrefFungsion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool temp = prefs.getBool(GlobalKeySharedPref.keyPrefIsLogin);
    if (temp) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            username: "tes",
          ),
        ),
      );
    }
  }

  savePrefFungsion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(GlobalKeySharedPref.keyPrefIsLogin, true);
    prefs.setString(GlobalKeySharedPref.keyPrefUsername, _nimFilter.text);
    prefs.setString(GlobalKeySharedPref.keyPrefFullname, "tes");
  }

  void onPressedFunction() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = false;
    });

    bool isLogin = false;
    dataAssisten.forEach((element) {
      if (_nimFilter.text == element["UserName"] &&
          _passwordFilter.text == element["PassWord"]) {
        isLogin = true;
        print(element);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DashboardPage(
              username: element["FullName"],
            ),
          ),
        );
      }
    });
    savePrefFungsion();

    if(!isLogin)
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Username or Password is Wrong"),
        );
      },
    );
  }
}
