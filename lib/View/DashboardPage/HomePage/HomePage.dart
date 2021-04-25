import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String token;
  final String nama;

  const HomePage({this.token, this.nama});

  @override
  _HomePageState createState() => _HomePageState(this.token, this.nama);
}

class _HomePageState extends State<HomePage> {
  final String _token;
  final String name;

  _HomePageState(this._token, this.name);

  clearPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg2,
      appBar: AppBar(
        backgroundColor: PaletteColor.primary,
        title: Text("Hallo! " + name),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                clearPref();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              children: [
                Card(
                  child: Center(
                    child: Text("Text"),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text("Text"),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text("Text"),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text("Text"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 150,
                      child: Center(child: Text(_token)))),
            ),
          ],
        ),
      ),
    );
  }
}
