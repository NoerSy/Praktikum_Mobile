import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String token;
  final String nama;
  final String username;

  const HomePage({this.token, this.nama, this.username});

  @override
  _HomePageState createState() =>
      _HomePageState(this.token, this.nama, this.username);
}

class _HomePageState extends State<HomePage> {
  final String _token;
  final String name;
  final String username;

  _HomePageState(this._token, this.name, this.username);

  clearPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isLogined", false);
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg2,
      appBar: AppBar(
        backgroundColor: PaletteColor.primary,
        title: Text("Home Page"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: "Logout",
                  child: Text("Logout"),
                ),
              ],
              onChanged: (_) {
                clearPref();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Card(
                  child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        username,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )),
            ),
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
          ],
        ),
      ),
    );
  }
}
