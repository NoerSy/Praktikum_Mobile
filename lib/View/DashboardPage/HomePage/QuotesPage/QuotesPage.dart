
import 'package:flutter/material.dart';
import 'package:modul3/Model/LOTR/Quote.dart';
import 'package:modul3/Provider/QuoteProvider.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class QuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Quote>(
        future: Provider.of<QuoteProvider>(context, listen: false).getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, _) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title : Center(
                      child: Text(
                        '"'+snapshot.data.docs[_].dialog + '"',
                      ),
                    ),
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
