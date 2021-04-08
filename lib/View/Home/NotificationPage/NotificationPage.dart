

import 'package:flutter/material.dart';
import 'package:modul3/Model/Notif.dart';

class NotificationPage extends StatefulWidget {
  List<Notif> item;
  NotificationPage({@required this.item});

  @override
  _NotificationPageState createState() => _NotificationPageState(item);
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notif> _item;
  _NotificationPageState(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      padding: const EdgeInsets.only(top: 2),
      child: ListView.builder(
        itemCount: _item.length,
        itemBuilder: (context, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
            child: Card(
              child: ListTile(
                title: Text(_item[_].title),
                subtitle: Text(_item[_].message),
              ),
            ),
          );
        },
      ),
    );
  }
}
