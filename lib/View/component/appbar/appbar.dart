import 'package:flutter/material.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';

AppBar appbar({@required String title}) {
  return AppBar(
    backgroundColor: PaletteColor.primarybg2,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    title: Text(
      title,
      style: TypographyStyle.title.merge(
        TextStyle(
          fontSize: 18,
        ),
      ),
    ),
    elevation: 0,
  );
}
