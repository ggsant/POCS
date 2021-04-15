class Movie {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  Movie(this.id, this.popularity, this.title, this.backPoster, this.poster,
      this.overview, this.rating);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}

// A classe Movie contém todas as informações de cada filme da lista e estamos mapeando os dados JSON de nossa API para nossas variáveis ​​usando o método fromJson de dardo.
