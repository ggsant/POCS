import 'package:poc_triple/app/features/home/domain/entities/random_event_entity.dart';

class RandomEventModel extends RandomEventEntity {
  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;

  RandomEventModel({
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
  }) : super(
          activity: activity,
          accessibility: accessibility,
          type: type,
          participants: participants,
          price: price,
          link: link,
          key: key,
        );

  factory RandomEventModel.fromJson(Map<String, dynamic> json) {
    return RandomEventModel(
      activity: json['activity'],
      accessibility: json['accessibility'].toDouble(),
      type: json['type'],
      participants: json['participants'],
      price: json['price'].toDouble(),
      link: json['link'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['activity'] = this.activity;
    data['accessibility'] = this.accessibility;
    data['type'] = this.type;
    data['participants'] = this.participants;
    data['price'] = this.price;
    data['link'] = this.link;
    data['key'] = this.key;
    return data;
  }

  String toString() {
    return '{"----------activity": ${this.activity},"accessibility": ${this.accessibility},"type": ${this.type},"participants": "${this.participants}","price": "${this.price}","link": "${this.link}","key": "${this.key}"}';
  }
}
