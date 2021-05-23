import 'package:flutter/material.dart';
import 'package:modul3/Model/LOTR/Books.dart';
import 'package:modul3/Provider/BooksProviders.dart';
import 'package:modul3/View/DashboardPage/HomePage/BooksPage/BookChaptersPage.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait(
          [Provider.of<BooksProviders>(context, listen: false).getBooks()]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: indicatorLoad(),
          );
        }
        return Consumer<BooksProviders>(builder: (context, data, _) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                  itemCount: data.dataBooks.docs.length,
                  itemBuilder: (context, _) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookChaptersPage(
                              id: data.dataBooks.docs[_].id,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          child: Center(
                            child: Text(
                              data.dataBooks.docs[_].name,
                              style: TypographyStyle.subtitle1,
                            ),
                          ),
                          height: 120,
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
      },
    );
  }
}
