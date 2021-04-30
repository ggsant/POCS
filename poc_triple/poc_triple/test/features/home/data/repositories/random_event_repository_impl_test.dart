import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_triple/app/core/errors/exeptions/exeptions.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/features/home/data/datasources/random_event_datasource_impl.dart';
import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';
import 'package:poc_triple/app/features/home/data/repositories/random_event_repository_impl.dart';

class MocRandomEventDatasourceImpl extends Mock
    implements RandomEventDatasourceImpl {}

void main() {
  late MocRandomEventDatasourceImpl datasource;
  late RandomEventRepositoryImpl repository;
  setUp(() {
    datasource = MocRandomEventDatasourceImpl();
    repository = RandomEventRepositoryImpl(remoteDataSource: datasource);
  });

  final tRandomEvent = RandomEventModel(
    activity: '',
    accessibility: 0.0,
    type: '',
    participants: 0,
    price: 0.0,
    link: '',
    key: '0',
  );

  group('getRandomEvent', () {
    test('Should return movie model when getRandomEvent calls the datasource',
        () async {
      //*arrange
      when(() => datasource.getRandomEvent())
          .thenAnswer((_) async => tRandomEvent);
      //?act
      final result = await repository.getRandomEvent();
      //!assert
      expect(result, Right(tRandomEvent));
      verify(() => datasource.getRandomEvent()).called(1);
    });
    test(
        'should return a server failure when the getRandomEvent call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.getRandomEvent()).thenThrow(ServerException());
      //?act
      final result = await repository.getRandomEvent();
      //!assert
      expect(result, Left(ServerFailure()));
      verify(() => datasource.getRandomEvent()).called(1);
    });
  });
}
