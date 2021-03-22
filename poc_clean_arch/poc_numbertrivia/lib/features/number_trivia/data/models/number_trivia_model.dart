import 'package:flutter/material.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/entities/number_trivia_entity.dart';

class NumberTriviaModel extends NumberTriviaEntity {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);

  //Vamos primeiro implementar a lógica de conversão que será o  método fromJson , que deve retornar uma  instância de NumberTriviaModel  com os mesmos dados que estão presentes na string JSON.
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
