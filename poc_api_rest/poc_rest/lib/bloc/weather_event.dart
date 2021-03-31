import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;

  const WeatherRequested({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

//Sempre que um usuário digitar uma cidade, adicionaremos um evento WeatherRequested à cidade especificada e nosso bloc será responsável por descobrir como o tempo está aí e retornar um novo WeatherState.
