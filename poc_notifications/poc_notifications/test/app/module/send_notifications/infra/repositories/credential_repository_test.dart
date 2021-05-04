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

  final tNotificationModel = CredentialResult('', '', '');

  group('CredentialRepositoryImpl', () {
    test(
        'Should return CredentialResult when saveCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.saveCredential(const CredentialResultEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.saveCredential(const CredentialResultEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.saveCredential(const CredentialResultEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the saveCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.saveCredential(const CredentialResultEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.saveCredential(const CredentialResultEmpty());
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.saveCredential(const CredentialResultEmpty()))
          .called(1);
    });
    test(
        'Should return CredentialResult when fetchCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.fetchCredential(const CredentialResultEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.fetchCredential(const CredentialResultEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.fetchCredential(const CredentialResultEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the fetchCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.fetchCredential(const CredentialResultEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.fetchCredential(const CredentialResultEmpty());
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.fetchCredential(const CredentialResultEmpty()))
          .called(1);
    });
    test(
        'Should return CredentialResult when deleteCredential calls the datasource ',
        () async {
      //*arrange
      when(() => datasource.deleteCredential(const CredentialResultEmpty()))
          .thenAnswer((_) async => tNotificationModel);
      //?act
      final response =
          await repository.deleteCredential(const CredentialResultEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.deleteCredential(const CredentialResultEmpty()))
          .called(1);
    });
    test(
        'should return a DataSourceFailure when the deleteCredential call to datasource is unsucessful',
        () async {
      //*arrange
      when(() => datasource.deleteCredential(const CredentialResultEmpty()))
          .thenThrow(DataSourceCredentialFailure(''));
      //?act
      final response =
          await repository.deleteCredential(const CredentialResultEmpty());
      //!assert
      expect(response.fold(id, id), isA<DataSourceCredentialFailure>());
      verify(() => datasource.deleteCredential(const CredentialResultEmpty()))
          .called(1);
    });
  });
}
