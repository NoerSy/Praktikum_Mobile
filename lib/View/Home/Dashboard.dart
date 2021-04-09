

import 'package:flutter/material.dart';
import 'package:modul3/Model/Notif.dart';
import 'package:modul3/Service/PushNotificationService.dart';
import 'package:modul3/View/Home/HomePage/HomePage.dart';
import 'package:modul3/View/Home/NotificationPage/NotificationPage.dart';
import 'package:modul3/View/component/AddNotification.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  final PushNotificationService _navigationService = PushNotificationService();
  final AddNotification _addNotification = new AddNotification();
  String _token = "Waiting for token...";
  int _bottomNavBarSelectedIndex = 0;
  bool _newNotification = false;
  List<Notif> _item = [];

  void fungsi(Notif data) {
    setState(() {
      _newNotification = _bottomNavBarSelectedIndex == 1 ? false : true;
      _item.add(data);
    });
  }

  _onItemTapped(index) {
    if (index != _bottomNavBarSelectedIndex) {
      if (index != 2) {
        setState(() {
          if (index == 1) {
            _newNotification = false;
          }
          _bottomNavBarSelectedIndex = index;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _navigationService.initialise(fungsi);
    _navigationService.getToken().then((value) {
      setState(() {
        _token = value;
      });
    });
    print(_token);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomePage(),
      NotificationPage(item: _item),
    ];

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _addNotification.addNotificationPopUp(context: context, token: _token);
            print(_token);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: _newNotification
                  ? Icon(Icons.notifications_active,
                  color: Colors.pink)
                  : Icon(
                Icons.notifications,
              ),
              title: _newNotification
                  ? Text(
                'Notifications',
                style: TextStyle(color: Colors.pink),
              )
                  : Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: _newNotification
                  ? Icon(Icons.notifications_active,
                      color: Colors.pink)
                  : Icon(
                      Icons.notifications,
                    ),
              title: _newNotification
                  ? Text(
                      'Notifications',
                      style: TextStyle(color: Colors.pink),
                    )
                  : Text('Notifications'),
            ),
          ],
          currentIndex: _bottomNavBarSelectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
        body: _children[_bottomNavBarSelectedIndex]);
  }

  Widget TokenPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("Token : ", style: TextStyle(color: Colors.white),),
            ),
            Text(
              _token,
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
