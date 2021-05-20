

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modul3/thame/PaletteColor.dart';

Widget indicatorLoad() {
  return SpinKitFoldingCube(
    size: 45,
    color: PaletteColor.primary,
  );
}