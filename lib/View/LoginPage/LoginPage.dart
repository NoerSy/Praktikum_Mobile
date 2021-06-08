import 'package:flutter/material.dart';
import 'package:modul3/View/DashboardPage/DashboardPage.dart';
import 'package:modul3/View/LoginPage/component/AuthLogin.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/config/GlobalKeySharedPref.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsplash_client/unsplash_client.dart';

import 'component/ButtonLogin.dart';
import 'component/MainForms.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nimController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool isLoading = false;

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
                        child: Image.asset(
                          'assets/imge/icon.png',
                          width: 130,
                        ),
                      ),
                      MainForms(
                        nimFilter: _nimController,
                        passwordFilter: _passwordController,
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
          Align(
            child: loadingIndicator,
            alignment: FractionalOffset.center,
          ),
        ],
      ),
    );
  }

  savePrefFungsion(String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(GlobalKeySharedPref.keyPrefIsLogin, true);
    prefs.setString(GlobalKeySharedPref.keyPrefUsername, _nimController.text);
    prefs.setString(GlobalKeySharedPref.keyPrefFullname, nama);
  }

  void onPressedFunction() async {

    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = await AuthLogin.auth(username: _nimController.text, password: _passwordController.text);

    setState(() {
      isLoading = false;
    });

      if (isLogin) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DashboardPage(
              fullname: " ",//element["FullName"],
              username: " ",//element["UserName"],
            ),
          ),
        );
        //savePrefFungsion(element["FullName"]);
      }

    if (!isLogin)
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
