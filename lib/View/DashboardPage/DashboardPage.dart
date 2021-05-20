import 'package:flutter/material.dart';
import 'package:modul3/Model/KelasModel/Kelas.dart';
import 'package:modul3/Model/KelasModel/Notif.dart';
import 'package:modul3/Model/KelasModel/Scadule.dart';
import 'package:modul3/Service/PushNotificationService.dart';
import 'package:modul3/View/component/AddNotification.dart';

import 'HomePage/HomePage.dart';
import 'NotificationPage/NotificationPage.dart';
import 'SchadulePage/SchadulePage.dart';

class DashboardPage extends StatefulWidget {
  final String username;
  final String fullname;

  const DashboardPage({@required this.username, this.fullname});

  @override
  _Dashboard createState() => _Dashboard(this.username, this.fullname);
}

class _Dashboard extends State<DashboardPage> {
  final PushNotificationService _navigationService = PushNotificationService();
  final AddNotification _addNotification = new AddNotification();
  final String username;
  final String fullname;
  String _token = "Waiting for token...";
  int _bottomNavBarSelectedIndex = 0;
  bool _newNotification = false;
  bool _newSchedule = false;
  List<Notif> _notif = [];
  List<Kelas> _schadule = [];
  List<DataKelas> _itemKelas = [];
  List<String> _list = [];

  _Dashboard(this.username, this.fullname);

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
      HomePage(
        token: _token,
        nama: fullname,
        username: username,
      ),
      ScadulePage(item: _schadule),
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
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: _newSchedule
                  ? Icon(Icons.schedule, color: Colors.pink)
                  : Icon(
                      Icons.schedule,
                    ),
              title: _newSchedule
                  ? Text(
                      'Schedule',
                      style: TextStyle(color: Colors.pink),
                    )
                  : Text('Schedule'),
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

  void _handlerScadule(Schedule item) {
    print("schedule yes : " + item.toJson().toString());
    int index = _list.indexWhere((value) => value.contains(item.data.hari));
    _newSchedule = _bottomNavBarSelectedIndex == 1 ? false : true;
    setState(() {
      if (index >= 0) {
        _itemKelas = _schadule[index].data;
        _itemKelas.add(DataKelas(
          nama: item.data.kelas,
          lab: item.data.lab,
          tempat: item.data.tempat,
          jam: item.data.jam,
        ));
      } else {
        _itemKelas = [];
        _itemKelas.add(DataKelas(
            nama: item.data.kelas,
            lab: item.data.lab,
            tempat: item.data.tempat,
            jam: item.data.jam));
        _schadule.add(Kelas(schedule: item.data.hari, data: _itemKelas));
        _list.add(item.data.hari);
      }
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
