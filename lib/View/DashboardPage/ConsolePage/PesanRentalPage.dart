import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modul3/View/component/appbar/appbar.dart';
import 'package:modul3/provider/ProfileProvider.dart';
import 'package:modul3/provider/SewaProvider.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PesanRentalPage extends StatefulWidget {
  final String description, type, merek, image;
  final int isSewa, id;

  const PesanRentalPage({
    @required this.description,
    @required this.type,
    @required this.merek,
    @required this.isSewa,
    @required this.image,
    @required this.id,
  });

  @override
  _PesanRentalPageState createState() => _PesanRentalPageState();
}

class _PesanRentalPageState extends State<PesanRentalPage> {
  String _datePicker;
  String _startAt;
  String _endStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "title"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Image.network(widget.image),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 4),
                        child: Text(widget.type),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 2, left: 4),
                              child: Text(widget.merek),
                            ),
                            Card(
                              color: widget.isSewa == 2
                                  ? PaletteColor.blue
                                  : PaletteColor.green,
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(widget.isSewa == 2
                                    ? "Menunggu"
                                    : "Tersedia"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Container(
                                margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 50,
                                    bottom:
                                        MediaQuery.of(context).size.height / 4),
                                child: Card(
                                  child: SfDateRangePicker(
                                    onSelectionChanged: (value) {
                                      setState(() {
                                        _startAt = DateFormat('dd-MM-yyyy')
                                            .format(value.value.startDate)
                                            .toString();

                                        _endStart = DateFormat('dd-MM-yyyy')
                                            .format(value.value.endDate ??
                                                value.value.startDate)
                                            .toString();

                                        _datePicker =
                                            _startAt + ' - ' + _endStart;
                                      });
                                    },
                                    onSubmit: (value) {
                                      Navigator.of(context).pop();
                                      print(_datePicker);
                                    },
                                    onCancel: () {
                                      Navigator.of(context).pop();
                                    },
                                    showActionButtons: true,
                                    selectionMode:
                                        DateRangePickerSelectionMode.range,
                                    initialSelectedDate: DateTime.now(),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: _datePicker != null
                              ? Text(_datePicker)
                              : Text("Pilih Durasi Sewa"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                child: Card(
                  child: InkWell(
                    onTap: () {
                      SewaProvider.postPesanan(
                        id: widget.id,
                        startAt: _startAt,
                        endAt: _endStart,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      width: widget.isSewa == 2 ? 100 : 200,
                      child: Text("Pesan"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
