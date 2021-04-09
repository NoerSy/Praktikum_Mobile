

import 'package:flutter/material.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';

class ClassPractice extends StatelessWidget {
  final String kelas, jam, lab, pc;

  ClassPractice({@required this.kelas, this.jam, this.lab, this.pc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(12),
          title: Text(
            kelas,
            style: TypographyStyle.caption2.merge(TextStyle(fontSize: 18)),
          ),
          subtitle: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.access_alarm,
                  color: PaletteColor.primary,
                ),
                SizedBox(width: 4),
                Text(
                  jam,
                  style: TypographyStyle.subtitle2.merge(
                    TextStyle(color: PaletteColor.grey60),
                  ),
                ),
                SizedBox(width: 14),
                Icon(
                  Icons.meeting_room,
                  color: PaletteColor.primary,
                ),
                SizedBox(width: 4),
                Text(
                  lab,
                  style: TypographyStyle.subtitle2.merge(
                    TextStyle(color: PaletteColor.grey60),
                  ),
                ),
                SizedBox(width: 14),
                Icon(
                  Icons.computer,
                  color: PaletteColor.primary,
                ),
                SizedBox(width: 4),
                Text(
                  pc,
                  style: TypographyStyle.subtitle2.merge(
                    TextStyle(color: PaletteColor.grey60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
