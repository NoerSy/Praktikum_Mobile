
import 'package:flutter/material.dart';
import 'package:modul3/Model/Kelas.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/TypographyStyle.dart';

import 'component/classPractice.dart';

class ScadulePage extends StatefulWidget {
  final List<Kelas> item;

  const ScadulePage({@required this.item});

  @override
  _ScadulePageState createState() => _ScadulePageState(this.item);
}

class _ScadulePageState extends State<ScadulePage> {
  final List<Kelas> _schadule;
  _ScadulePageState(this._schadule);

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
        itemCount: _schadule.length,
        itemBuilder: (context, _) {
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
                      _schadule[_].schedule,
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
                  child: /*Column(
                    children: [
                      ClassPractice(
                        kelas: _listKelas[_].nama,
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
                  ),*/

                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _schadule[_].data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ClassPractice(
                        kelas: _schadule[_].data[index].nama,
                        jam: _schadule[_].data[index].jam,
                        lab: _schadule[_].data[index].lab,
                        pc: _schadule[_].data[index].tempat,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
