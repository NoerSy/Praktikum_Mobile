import 'package:flutter/material.dart';
import 'package:modul3/Provider/ConsoleProvider.dart';
import 'package:modul3/View/component/appbar/appbar.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/model/SewaConsole/Consoles.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class ConsolePage extends StatefulWidget {
  @override
  _ConsolePageState createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "title"),
      body: FutureBuilder<Consoles>(
        future:
            Provider.of<ConsoleProvider>(context, listen: false).getConsoles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }

          var _data = snapshot.data.data.where((element) => element.isSewa == 1).toList();

          print(_data.length);

          return Container(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Stack(
                    children: [
                      Image.network(_data[index].image),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ListTile(
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text(_data[index].description),
                                ),
                                Text(_data[index].type),
                                Text(
                                  _data[index].merek,
                                  style: TypographyStyle.mini,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
