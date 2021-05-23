import 'package:flutter/material.dart';
import 'package:modul3/View/DashboardPage/HomePage/BooksPage/BooksPage.dart';
import 'package:modul3/View/DashboardPage/HomePage/CharactersPage/CharactersPage.dart';
import 'package:modul3/View/LoginPage/LoginPage.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
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
      /* appBar: AppBar(
        backgroundColor: PaletteColor.primarybg2,
        title: Text("Home Page", style: TypographyStyle.subtitle1),
        elevation: 1,
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
                color: PaletteColor.black,
              ),
            ),
          ),
          SizedBox(width: 8)
        ],
      ),*/
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.wallpapersafari.com/60/17/0FwhAx.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  alignment: Alignment.center,
                  color: PaletteColor.black.withOpacity(0.5),
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 18, bottom: 24),
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: Text(
                    "Lord of The Ring",
                    style: TypographyStyle.title
                        .merge(TextStyle(color: PaletteColor.primarybg2)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    clearPref();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.settings,
                    size: 22,
                    color: PaletteColor.primarybg2,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200, bottom: 12),
                padding: const EdgeInsets.only(left: 16, right: 16),
                alignment: Alignment.center,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 4, bottom: 4),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.search),
                        ),
                        suffixIconConstraints: BoxConstraints(),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                cardView(
                  title: 'Books',
                  icon: Icon(
                    Icons.book_online_rounded,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BooksPage(),
                      ),
                    );
                  },
                ),
                cardView(
                  title: 'Movies',
                  icon: Icon(
                    Icons.movie_outlined,
                  ),
                ),
                cardView(
                  title: 'Characters',
                  icon: Icon(
                    Icons.people,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CharactersPage(),
                      ),
                    );
                  },
                ),
                cardView(
                  title: 'Quotes',
                  icon: Icon(
                    Icons.wb_incandescent_outlined,
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 4 / 2,
              ),
            ),
          ),

          // Container(
          //   child: FutureBuilder(
          //     future: Future.wait([]),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Scaffold(
          //           body: indicatorLoad(),
          //         );
          //       }
          //       return Consumer(builder: (context, data, _) {
          //         return Scaffold(
          //           body: Padding(
          //             padding: const EdgeInsets.all(12),
          //             child: ListView.builder(
          //                 itemCount: data.dataBooks.docs.length,
          //                 itemBuilder: (context, _) {
          //                   return Card(
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(15.0),
          //                     ),
          //                     child: Container(
          //                       child: Center(
          //                         child: Text(
          //                           data.dataBooks.docs[_].name,
          //                           style: TypographyStyle.subtitle1,
          //                         ),
          //                       ),
          //                       height: 120,
          //                     ),
          //                   );
          //                 }),
          //           ),
          //         );
          //       });
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

Widget cardView({@required String title, Icon icon, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 200,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Container(
                width: 60,
                height: 60,
                child: icon,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    ),
  );
}
