import 'package:flutter/material.dart';
import 'package:modul3/Model/LOTR/Chapters.dart';
import 'package:modul3/Provider/BookChaptersProvider.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class BookChaptersPage extends StatefulWidget {
  final String id;

  const BookChaptersPage({@required this.id});

  @override
  _BookChaptersPageState createState() => _BookChaptersPageState();
}

class _BookChaptersPageState extends State<BookChaptersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Chapters>(
        future: Provider.of<BookChaptersProvider>(context, listen: false)
            .getChapters(id: widget.id),
        builder: (context, sanpshot) {
          if (sanpshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }
          return ListView.builder(
            itemCount: sanpshot.data.docs.length,
            itemBuilder: (context, _) {
              return Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        sanpshot.data.docs[_].chapterName,
                        style: TypographyStyle.subtitle1,
                      ),
                    ),
                    height: 120,
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
