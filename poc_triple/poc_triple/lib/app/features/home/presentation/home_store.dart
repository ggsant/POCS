import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/core/noparams/noparams.dart';
import 'package:poc_triple/app/features/home/domain/entities/random_event_entity.dart';
import 'package:poc_triple/app/features/home/domain/usecases/random_event_usecase.dart';

class HomeStore extends NotifierStore<ServerFailure, RandomEventEntity> {
  final GetRandomEventUseCase getRandomEventUseCase;
  HomeStore(this.getRandomEventUseCase)
      : super(RandomEventEntity(
          accessibility: 0.0,
          activity: '',
          key: '',
          link: '',
          participants: 0,
          price: 0.0,
          type: '',
        )) {
    getRandomEvent();
  }

  void getRandomEvent() {
    executeEither(
      () => getRandomEventUseCase(NoParams()),
    );
  }
}
