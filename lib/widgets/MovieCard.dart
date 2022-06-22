import 'package:flutter/material.dart';
import 'package:myapplicationtest/models/Movie.dart';

class MovieCard
{
  static Widget movieCard(Movie movie) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(2),
      child: Row(children: [
        Text(movie.title),
        Text(movie.overview),
        Image.network(movie.imageUrl),
      ],),
    );
  }
}