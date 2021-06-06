import 'package:flutter/material.dart';
import 'package:modul3/Provider/ConsoleProvider.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/model/SewaConsole/Consoles.dart';
import 'package:provider/provider.dart';

class ConsolePage extends StatefulWidget {

  @override
  _ConsolePageState createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Consoles>(
      future: Provider.of<ConsoleProvider>(context, listen: false)
          .getConsoles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: indicatorLoad(),
          );
        }
        return Container(
          child: GridView.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data.data[index].merek),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        );
      },
    );
  }
}
