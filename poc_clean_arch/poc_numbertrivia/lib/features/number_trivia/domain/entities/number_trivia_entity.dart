import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTriviaEntity extends Equatable {
  final String text;
  final int number;

  NumberTriviaEntity({
    @required this.text,
    @required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
