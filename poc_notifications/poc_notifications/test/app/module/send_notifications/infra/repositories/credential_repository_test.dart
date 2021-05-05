import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
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

  final tNotificationModel = [CredentialResultHive('', '', '', '')];

  group('CredentialRepositoryImpl', () {
    test(
        'Should return CredentialResult when saveCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.saveCredential(const CredentialResultHiveEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.saveCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.saveCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the saveCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.saveCredential(const CredentialResultHiveEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.saveCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response, isA<DataSourceCredentialFailure>());
      verify(() => datasource.saveCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
    test(
        'Should return CredentialResult when fetchCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.fetchCredential(const CredentialResultHiveEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.fetchCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() =>
              datasource.fetchCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the fetchCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.fetchCredential(const CredentialResultHiveEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.fetchCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() =>
              datasource.fetchCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
    test(
        'Should return CredentialResult when deleteCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.deleteCredential(const CredentialResultHiveEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.deleteCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() =>
              datasource.deleteCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the deleteCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.deleteCredential(const CredentialResultHiveEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.deleteCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response, isA<DataSourceCredentialFailure>());
      verify(() =>
              datasource.deleteCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });

    test(
        'Should return CredentialResult when updateCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.updateCredential(const CredentialResultHiveEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.updateCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() =>
              datasource.updateCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the updateCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.updateCredential(const CredentialResultHiveEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.updateCredential(const CredentialResultHiveEmpty());
      //!assert
      expect(response, isA<DataSourceCredentialFailure>());
      verify(() =>
              datasource.updateCredential(const CredentialResultHiveEmpty()))
          .called(1);
    });
  });
}
