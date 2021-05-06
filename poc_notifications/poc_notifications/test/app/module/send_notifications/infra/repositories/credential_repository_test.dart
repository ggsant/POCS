import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/datasource/hive_datasource.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/repositories/credential_repository.dart';

class HiveDataSouceImplMock extends Mock implements HiveDataSouce {}

void main() {
  late HiveDataSouceImplMock datasource;
  late CredentialRepositoryImpl repository;
  setUpAll(() {
    datasource = HiveDataSouceImplMock();
    repository = CredentialRepositoryImpl(datasource);
  });

  final tNotificationModel = CredentialResult('', '', '', '');

  group('CredentialRepositoryImpl', () {
    test('Should return CredentialResult when saveCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.saveCredential(CredentialResult.empty())).thenAnswer((_) async => tNotificationModel);
      //?act
      final response = await repository.saveCredential(CredentialResult.empty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.saveCredential(CredentialResult.empty())).called(1);
    });
    //todo: nao passou esse trem aqui tbm
    test('should return a DataSourceFailure when the saveCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.saveCredential(CredentialResult.empty())).thenThrow((Left(DataSourceCredentialFailure(''))));
      //?act
      final response = await repository.saveCredential(CredentialResult.empty());
      //!assert
      expect(response, isA<CredentialFailures>());
      verify(() => datasource.saveCredential(CredentialResult.empty())).called(1);
    });
    test('Should return CredentialResult when fetchCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.fetchCredential('')).thenAnswer((_) async => [tNotificationModel]);
      //?act
      final response = await repository.fetchCredential('');
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.fetchCredential('')).called(1);
    });
    test('should return a DataSourceFailure when the fetchCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.fetchCredential('')).thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response = await repository.fetchCredential('');
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.fetchCredential('')).called(1);
    });
    test('Should return CredentialResult when deleteCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.deleteCredential('')).thenAnswer((_) async => unit);
      //?act
      final response = await repository.deleteCredential('');
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.deleteCredential('')).called(1);
    });
    //todo: nao passou
    test('should return a DataSourceFailure when the deleteCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.deleteCredential('')).thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response = await repository.deleteCredential('');
      //!assert
      expect(response, isA<DataSourceCredentialFailure>());
      verify(() => datasource.deleteCredential('')).called(1);
    });

    test('Should return CredentialResult when updateCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.updateCredential(CredentialResult.empty())).thenAnswer((_) async => unit);
      //?act
      final response = await repository.updateCredential(CredentialResult.empty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.updateCredential(CredentialResult.empty())).called(1);
    });
    test('should return a DataSourceFailure when the updateCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.updateCredential(CredentialResult.empty())).thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response = await repository.updateCredential(CredentialResult.empty());
      //!assert
      expect(response, isA<DataSourceCredentialFailure>());
      verify(() => datasource.updateCredential(CredentialResult.empty())).called(1);
    });
  });
}
