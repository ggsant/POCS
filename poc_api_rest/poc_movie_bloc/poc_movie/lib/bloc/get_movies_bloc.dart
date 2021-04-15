import 'package:poc_movie/model/movie_response.dart';
import 'package:poc_movie/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _movieRepository.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesBloc = MovieListBloc();

//O _subject é um objeto BehaviourSubject <MovieResponse> e esse objeto é usado para buscar dados da fonte de dados na forma de MovieResponse e irá passar os dados buscados para a IU na forma de fluxos.
