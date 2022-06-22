import 'package:flutter/material.dart';
import 'package:myapplicationtest/models/Movie.dart';
import 'package:myapplicationtest/pages/page_state.dart';
import 'package:myapplicationtest/widgets/APIMovie.dart';
import 'package:myapplicationtest/widgets/MovieCard.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  ApiMovies apiMovies = ApiMovies();
  Map<String, dynamic>? response;
  final List<Movie> moviesList = [];

  Future<void> getPopularMovies() async {
    ApiMovies api = ApiMovies();
    Map<String, dynamic> mapMovies = await api.getPopular();
    if (mapMovies["code"] == 0) {
      List<Movie> movies = Movie.jsonToMovie(mapMovies["body"]);
      movies.forEach((Movie movie) {
        moviesList.add(movie);
      });
    } else {}
  }

  void initState() {
    super.initState();
    getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    double largeur = (MediaQuery.of(context).size.width) - 12;
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: const Text('Catalogue'),
      ),
      body: Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: moviesList.length,
            itemBuilder: (BuildContext context, int index) {
              Movie movie = moviesList[index];
              return Container(
                padding: const EdgeInsets.all(2),
                child: Row(children: [
                  Text(movie.title),
                  Text(movie.overview),
                  Image.network(movie.imageUrl),
                ],),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )
        ],
      ),
    );
  }
}
