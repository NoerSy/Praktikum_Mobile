
class Kelas {
  Kelas({this.schedule, this.data});

  String schedule;
  List<DataKelas> data;
}

class DataKelas {
  DataKelas({
    this.nama,
    this.tempat,
    this.lab,
    this.jam,
  });

  String nama;
  String tempat;
  String lab;
  String jam;
}


