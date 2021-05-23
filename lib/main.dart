import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modul3/Provider/BookChaptersProvider.dart';
import 'package:modul3/Provider/BooksProviders.dart';
import 'package:modul3/View/DashboardPage/DashboardPage.dart';
import 'package:modul3/View/SplashScreenPage/SplashScreenPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookChaptersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BooksProviders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreenPage(),
        ),
      ),
    );

    /*MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(username: "username", fullname: ""),
    );*/
  }
}
