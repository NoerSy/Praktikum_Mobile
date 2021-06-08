import 'package:flutter/material.dart';
import 'package:modul3/View/component/appbar/appbar.dart';
import 'package:modul3/View/component/logout.dart';
import 'package:modul3/model/SewaConsole/Profile.dart';
import 'package:modul3/provider/ProfileProvider.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg2,
      appBar: appbar(
        title: "Profile",
      ),
      body: FutureBuilder<Profile>(
        future: Provider.of<ProfileProvider>(context, listen: false).getMe(),
        builder: (context, snapshot) {

          if(snapshot.data.name == null) logout(ctx: context);

          return Column(
            children: [
              Container(
                height: 230,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: PaletteColor.primarybg2,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        spreadRadius: 0,
                        color: PaletteColor.grey60,
                        blurRadius: 1),
                  ],
                ),
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.height / 13,
                        backgroundImage: NetworkImage(
                          snapshot.data.image ?? "No Image",
                        ),
                        child: Text("no Image"),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 2, top: 8),
                        child: Text(
                          snapshot.data.name,
                          style: TypographyStyle.subtitle1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          color: Colors.deepOrangeAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              snapshot.data.role == 1 ? "Admin" : "User" ,
                              style: TypographyStyle.caption1.merge(TextStyle(
                                fontSize: 12,
                                color: PaletteColor.grey,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    _listTile(title: 'Name', subtitle: snapshot.data.name),
                    Divider(),
                    _listTile(title: 'Email', subtitle: snapshot.data.email),
                    Divider(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _listTile({@required String title, @required subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TypographyStyle.caption1
                  .merge(TextStyle(color: PaletteColor.grey60)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
