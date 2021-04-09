import 'package:flutter/material.dart';
import 'package:modul3/Model/Kelas.dart';
import 'package:modul3/Model/Notif.dart';
import 'package:modul3/Model/Scadule.dart';
import 'package:modul3/Service/PushNotificationService.dart';
import 'package:modul3/View/Home/HomePage/HomePage.dart';
import 'package:modul3/View/Home/NotificationPage/NotificationPage.dart';
import 'package:modul3/View/Home/SchadulePage/SchadulePage.dart';
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
  bool _newSchedule = false;
  List<Notif> _notif = [];
  List<Schedule> _schadule = [];
  List<Kelas> _kelas = [];

  void _handlerScadule(Schedule scadule) {
    print("schedule yes");
    _newSchedule = _bottomNavBarSelectedIndex == 1 ? false : true;
    for (Schedule temp in _schadule) {
      if (scadule.data.hari == temp.data.hari) {
        setState(() {
          _kelas.add(Kelas(
            nama: scadule.data.hari,
            tempat: scadule.data.tempat,
            jam: scadule.data.jam,
          ));
        });
      }
    }
    setState(() {
      _schadule.add(scadule);
      _kelas.add(Kelas(
        nama: scadule.data.hari,
        tempat: scadule.data.tempat,
        jam: scadule.data.jam,
      ));
    });
  }

  void _handlerNotification(Notif notif) {
    print("notif yes");
    setState(() {
      _newNotification = _bottomNavBarSelectedIndex == 2 ? false : true;
      _notif.add(notif);
    });
  }

  _onItemTapped(index) {
    if (index != _bottomNavBarSelectedIndex) {
      if (index != 3) {
        setState(() {
          if (index == 2) {
            _newNotification = false;
          }
          if (index == 1) {
            _newSchedule = false;
          }
          _bottomNavBarSelectedIndex = index;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _navigationService.initialise(
      handlerNotification: _handlerNotification,
      handlerScadule: _handlerScadule,
    );
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
      ScadulePage(item: _schadule, itemKelas: _kelas,),
      NotificationPage(item: _notif),
    ];

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addNotification.addNotificationPopUp(
                context: context, token: _token);
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
              title: Text('Schedule'),
            ),
            BottomNavigationBarItem(
              icon: _newSchedule
                  ? Icon(Icons.schedule, color: Colors.pink)
                  : Icon(
                      Icons.schedule,
                    ),
              title: _newSchedule
                  ? Text(
                      'Notifications',
                      style: TextStyle(color: Colors.pink),
                    )
                  : Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: _newNotification
                  ? Icon(Icons.notifications_active, color: Colors.pink)
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
              child: Text(
                "Token : ",
                style: TextStyle(color: Colors.white),
              ),
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
