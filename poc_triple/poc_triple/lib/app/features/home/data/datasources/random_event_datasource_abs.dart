import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';

abstract class IRandomEventDatasource {
  Future<RandomEventModel> getRandomEvent();
}
