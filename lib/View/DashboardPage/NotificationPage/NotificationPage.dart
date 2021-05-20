import 'package:flutter/material.dart';
import 'package:modul3/Model/KelasModel/Notif.dart';
import 'package:modul3/thame/PaletteColor.dart';

class NotificationPage extends StatefulWidget {
  final List<Notif> item;

  NotificationPage({@required this.item});

  @override
  _NotificationPageState createState() => _NotificationPageState(item);
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notif> _item;

  _NotificationPageState(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg2,
      appBar: AppBar(
        backgroundColor: PaletteColor.primary,
        title: Text("Notification"),
        elevation: 2,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
          itemCount: _item.length,
          itemBuilder: (context, _) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
              child: Card(
                child: ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: TextButton(
                              onPressed: () {
                                setState(() {
                                  _item.removeAt(_);
                                  Navigator.of(context).pop();
                                });
                                print(_item[_].data.message);
                              },
                              child: Text("Delete"),
                            ),
                          );
                        });
                  },
                  title: Text(_item[_].data.judul),
                  subtitle: Text(_item[_].data.message),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
