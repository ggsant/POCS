import 'movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList(),
        error = "";

  MovieResponse.withError(String errorValue)
      : movies = List(),
        error = errorValue;
}

//MovieResponse é uma classe de modelo de alto nível que consistirá em uma lista de filmes e string de erro se nossa chamada de API falhar ou retornar um erro em resposta.
