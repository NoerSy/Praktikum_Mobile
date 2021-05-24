
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modul3/Model/LOTR/Movies.dart';
import 'package:modul3/Provider/MoviesProvider.dart';
import 'package:modul3/View/DashboardPage/HomePage/MoviesPage/AllSeriesMoviePage/SeriesMoviePage.dart';
import 'package:modul3/View/component/indecatorLoad.dart';
import 'package:modul3/thame/TypographyStyle.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<String> urlImage = [
    'https://www.layar.id/wp-content/uploads/2017/11/Lord-of-the-rings-e1510289125718.jpg',
    'https://caragaleblog.files.wordpress.com/2015/01/hobbit-trilogy.jpg',
    'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1346810117l/15990233.jpg',
    'https://flxt.tmsimg.com/assets/p9458059_p_v10_ac.jpg',
    'https://images.moviesanywhere.com/e793dae889a5e6e1b4ba23fe0675d59e/893675ad-e689-4c5c-87c1-ac1363cd3824.jpg',
    'https://i.imgur.com/l2EuZDn.jpeg',
    'https://images-na.ssl-images-amazon.com/images/I/71sLg08monL._SL1073_.jpg',
    'https://www.reelviews.net/resources/img/posters/thumbs/return_of_the_king_poster.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movies>(
        future: Provider.of<MoviesProvider>(context, listen: false).getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: indicatorLoad(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, _) {
              List<Widget> content = [
                Image.network(
                  urlImage[_],
                  fit: BoxFit.cover,
                  height: 200,
                  width: (_ <= 1) ? MediaQuery.of(context).size.width : 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          snapshot.data.docs[_].runtimeInMinutes.toString() + ' Menit',
                          style: TypographyStyle.caption1,
                        ),
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(bottom: 8),
                      ),
                      Text(
                        snapshot.data.docs[_].name,
                        style: TypographyStyle.subtitle1.merge(TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ];
              return Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SeriesMoviePage(id: snapshot.data.docs[_].id, src: urlImage[_],),
                      ),
                    );
                  },
                  child: ListTile(
                    title: ( _ <= 1) ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: content,
                    ) : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: content,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
