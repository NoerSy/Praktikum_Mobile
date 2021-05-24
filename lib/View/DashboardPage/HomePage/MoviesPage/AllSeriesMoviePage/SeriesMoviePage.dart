


import 'package:flutter/material.dart';
import 'package:modul3/Model/LOTR/Movies.dart';
import 'package:modul3/Provider/MoviesProvider.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class SeriesMoviePage extends StatelessWidget {
  final String id;
  final String src;

  const SeriesMoviePage({@required this.id, this.src});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movies>(
        future:
        Provider.of<MoviesProvider>(context, listen: false).getSpecificMovie(id: id),
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
                  child: Column(
                    children: [
                      Container(child: Image.network(src),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            snapshot.data.docs[_].name,
                            style: TypographyStyle.subtitle1,
                          ),
                        ),
                      ),
                    ],
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
