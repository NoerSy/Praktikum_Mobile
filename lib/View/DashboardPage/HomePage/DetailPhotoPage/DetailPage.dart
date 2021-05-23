import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({@required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }
          return Consumer(
            builder: (BuildContext context, value, Widget child) {
              return Scaffold(
                body: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  initialScale: 0.5,
                  maxScale: 1.0,
                  minScale: 0.4,
                  imageProvider: NetworkImage(
                    value.dataPhoto.urls.regular,
                  ),
                ),
              );
            },
          );
        },
      );
  }
}
