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

  final tNotificationModel = CredentialResult('title', 'appId', 'token', 'id');
  final tNotificationModelList = [CredentialResult('title', 'appId', 'token', 'id')];

  group('CredentialRepositoryImpl - saveCredential', () {
    test('Should return CredentialResult when saveCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.saveCredential(tNotificationModel)).thenAnswer((_) async => Right(unit));
      //?act
      final response = await repository.saveCredential(tNotificationModel);
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(unit));
      verify(() => datasource.saveCredential(tNotificationModel)).called(1);
    });
    test('should return a DataSourceFailure when the saveCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.saveCredential(tNotificationModel)).thenThrow((DataSourceCredentialFailure('')));
      //?act
      final response = await repository.saveCredential(tNotificationModel);
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.saveCredential(tNotificationModel)).called(1);
    });
    test('should return a EmptyCredentialFieldFailure when the credential fiels is empty', () async {
      //*arrange
      when(() => datasource.saveCredential(tNotificationModel)).thenThrow((EmptyCredentialFieldFailure('')));
      //?act
      final response = await repository.saveCredential(tNotificationModel);
      //!assert
      expect(response.fold(id, id), isA<EmptyCredentialFieldFailure>());
      verify(() => datasource.saveCredential(tNotificationModel)).called(1);
    });
    test('should return a ValidationCredentialFailure when some field is empty', () async {
      //*arrange
      when(() => datasource.saveCredential(tNotificationModel)).thenThrow((ValidationCredentialFailure('')));
      //?act
      final response = await repository.saveCredential(tNotificationModel);
      //!assert
      expect(response.fold(id, id), isA<ValidationCredentialFailure>());
      verify(() => datasource.saveCredential(tNotificationModel)).called(1);
    });
  });

  group('CredentialRepositoryImpl - fetchCredential', () {
    test('Should return list of CredentialResult when fetchCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.fetchCredential()).thenAnswer((_) async => tNotificationModelList);
      //?act
      final response = await repository.fetchCredential();
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModelList));
      verify(() => datasource.fetchCredential()).called(1);
    });
    test('should return a DataSourceFailure when the fetchCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.fetchCredential()).thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response = await repository.fetchCredential();
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.fetchCredential()).called(1);
    });
  });

  group('CredentialRepositoryImpl - deleteCredential ', () {
    test('Should return CredentialResult when deleteCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.deleteCredential('')).thenAnswer((_) async => Right(unit));
      //?act
      final response = await repository.deleteCredential('');
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(unit));
      verify(() => datasource.deleteCredential('')).called(1);
    });
    test('should return a DataSourceFailure when the deleteCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.deleteCredential('')).thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response = await repository.deleteCredential('');
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.deleteCredential('')).called(1);
    });
    test('should return a EmptyCredentialFieldFailure when the credential fiels is empty', () async {
      //*arrange
      when(() => datasource.deleteCredential('credentialId')).thenThrow((EmptyCredentialFieldFailure('')));
      //?act
      final response = await repository.deleteCredential('credentialId');
      //!assert
      expect(response.fold(id, id), isA<EmptyCredentialFieldFailure>());
      verify(() => datasource.deleteCredential('credentialId')).called(1);
    });
  });

  group('CredentialRepositoryImpl - updateCredential', () {
    test('Should return CredentialResult when updateCredential calls the datasource ', () async {
      //*arrange
      when(() => datasource.updateCredential(tNotificationModel)).thenAnswer((_) async => Right(unit));
      //?act
      final response = await repository.updateCredential(tNotificationModel);
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(unit));
      verify(() => datasource.updateCredential(tNotificationModel)).called(1);
    });
    test('should return a DataSourceFailure when the updateCredential call to datasource is unsucessful', () async {
      //*arrange
      when(() => datasource.updateCredential(tNotificationModel)).thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response = await repository.updateCredential(tNotificationModel);
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.updateCredential(tNotificationModel)).called(1);
    });
    test('should return a EmptyCredentialFieldFailure when the credential fiels is empty', () async {
      //*arrange
      when(() => datasource.updateCredential(tNotificationModel)).thenThrow((EmptyCredentialFieldFailure('')));
      //?act
      final response = await repository.updateCredential(tNotificationModel);
      //!assert
      expect(response.fold(id, id), isA<EmptyCredentialFieldFailure>());
      verify(() => datasource.updateCredential(tNotificationModel)).called(1);
    });
    test('should return a ValidationCredentialFailure when some field is empty', () async {
      //*arrange
      when(() => datasource.updateCredential(tNotificationModel)).thenThrow((ValidationCredentialFailure('')));
      //?act
      final response = await repository.updateCredential(tNotificationModel);
      //!assert
      expect(response.fold(id, id), isA<ValidationCredentialFailure>());
      verify(() => datasource.updateCredential(tNotificationModel)).called(1);
    });
  });
}
