import 'package:equatable/equatable.dart';

class RandomEventEntity extends Equatable {
  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;

  RandomEventEntity({
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
  });

  @override
  List<Object> get props => [
        activity,
        accessibility,
        type,
        participants,
        price,
        link,
        key,
      ];
}
