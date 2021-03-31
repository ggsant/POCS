import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:poc_rest/repositories/repositories.dart';
import 'package:poc_rest/models/models.dart';
import 'package:poc_rest/bloc/blocs.dart';

import 'package:poc_rest/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
    
  }
}
