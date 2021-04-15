import 'package:dio/dio.dart';
import 'package:poc_movie/model/movie_response.dart';

class MovieRepository {
  final String apiKey = "af9d1af5e653c85b9c772d308bb3417c";
  static String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';

  Future<MovieResponse> getMovies() async {
    var params = {'api_key': apiKey, 'language': 'en-US', 'page': 1};

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}

// Agora vamos criar uma classe repository.dart dentro de um subdiretório chamado repositório de seu projeto, onde definiremos nossa chave API , URL base , endpoints , objeto cliente https e nossos métodos de chamada de rede que serão usados ​​para buscar dados de Apis. mapeie o JSON para seu modelo.
