import 'package:flutter/material.dart';
import 'package:modul3/Model/LOTR/Character.dart';
import 'package:modul3/Provider/CharactersProvider.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BookCharacters>(
        future: Provider.of<CharactersProvider>(context, listen: false).getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, _) {
              return Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        snapshot.data.docs[_].name,
                        style: TypographyStyle.button2,
                      ),
                    ),
                    height: 60,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
