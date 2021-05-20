import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modul3/Model/UnSplashModel/ModelImages.dart';
import 'package:modul3/Provider/ProviderHomePage.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final List<ModelImages> dataHompage;

  const HomePage({this.dataHompage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: GridView.builder(
          itemCount: widget.dataHompage.length,
          itemBuilder: (context, _) {
            return Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                height: 250,
                child: Stack(
                  children: [
                    Card(
                      child: Image.network(
                        widget.dataHompage[_].urls.regular,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.dataHompage[_].user.firstName,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Icon(Icons.thumb_up_alt_outlined, size: 12, color: Colors.white,),
                            ),
                            Text(
                              widget.dataHompage[_].likes.toString(),
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
    );
  }
}
