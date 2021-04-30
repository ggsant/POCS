import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/core/noparams/noparams.dart';
import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';
import 'package:poc_triple/app/features/home/domain/entities/random_event_entity.dart';
import 'package:poc_triple/app/features/home/domain/repositories/random_event_repository.dart';
import 'package:poc_triple/app/features/home/domain/usecases/random_event_usecase.dart';

class MockIRandomEventRepository extends Mock
    implements IRandomEventRepository {}

void main() {
  late MockIRandomEventRepository repository;
  late GetRandomEventUseCase usecase;

  final tRandomEvent = RandomEventModel(
    activity: '',
    accessibility: 0.0,
    type: '',
    participants: 0,
    price: 0.0,
    link: '',
    key: '0',
  );

  setUp(() {
    repository = MockIRandomEventRepository();
    usecase = GetRandomEventUseCase(repository);
  });

  group('Should test the getPupular usecase', () {
    test('should fetch a list of films that are among the popular api',
        () async {
      //*arrange
      when(() => repository.getRandomEvent())
          .thenAnswer((_) async => Right(tRandomEvent));
      //?act
      final response = await usecase(NoParams());
      //!assert
      expect(response, isA<Right>());
      expect(response.fold(id, id), isA<RandomEventModel>());
      expect(response.fold(id, id), isA<RandomEventEntity>());
      expect(response.fold(id, id), isNotNull);
      verify(() => repository.getRandomEvent());
    });
    test('should return a ServerFailure when don\'t succeed', () async {
      // Arrange
      when(() => repository.getRandomEvent())
          .thenAnswer((_) async => Left(ServerFailure()));
      // Act
      final result = await usecase(NoParams());
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getRandomEvent()).called(1);
    });
  });
}
