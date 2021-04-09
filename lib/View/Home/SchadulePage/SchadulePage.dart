
import 'package:flutter/material.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';

import 'component/classPractice.dart';

class ScadulePage extends StatefulWidget {
  @override
  _ScadulePageState createState() => _ScadulePageState();
}

class _ScadulePageState extends State<ScadulePage> {
  final List<String> days = <String>[
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];

  final List<String> kelas = <String>[
    'Pemrograman Fungsional F',
    'Pemrograman Dasar F'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletteColor.primarybg2,
      appBar: AppBar(
        backgroundColor: PaletteColor.primary,
        title: Text("Jadwal Praktikum"),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: days.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: PaletteColor.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      days[index],
                      style: TypographyStyle.caption2.merge(
                        TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: PaletteColor.primarybg,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClassPractice(
                        kelas: "Pemrograman Fungsional F",
                        jam: "00:00 - 00:00",
                        lab: "Lab A",
                        pc: "A25",
                      ),
                      Divider(
                        height: 2,
                        indent: 4,
                        endIndent: 4,
                        color: PaletteColor.grey60,
                      ),
                      ClassPractice(
                        kelas: "Pemrograman Dasar F",
                        jam: "00:00 - 00:00",
                        lab: "Lab A",
                        pc: "A25",
                      ),
                    ],
                  ),

                  /*ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: kelas.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ClassPractice(
                        kelas: kelas[index],
                        jam: "00:00 - 00:00",
                        lab: "Lab A",
                        pc: "A25",
                      );
                    },
                  ),*/
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
