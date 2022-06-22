class Movie {
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final String imageUrl;
  final double vote;
  Movie({required this.id,required this.title,required this.imageUrl,required this.overview,required
  this.releaseDate,required this.vote});


  static List<Movie> jsonToMovie(Map<String, dynamic> body){
    List<Movie> l =[];
    List<dynamic> results = body["results"];
    results.forEach((value) {
      Movie movie = Movie(
          id: value["id"],
          title: value["title"],
          overview: value["overview"],
          imageUrl: value["poster_path"],
          releaseDate: DateTime.parse(value["release_date"]),
          vote: double.tryParse(value["vote_average"].toString())!
      );
      l.add(movie);
    });
    return l;
  }




}