import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/credential_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/save_credential_usecase.dart';

class CredentialRepositoryMock extends Mock implements CredentialRepository {}

void main() {
  late CredentialRepositoryMock repository;
  late SaveCredentialsUseCaseImpl usecase;
  setUpAll(() {
    repository = CredentialRepositoryMock();
    usecase = SaveCredentialsUseCaseImpl(repository);
  });

  final tCredrentials = CredentialResult('title', 'appId', 'token', 'id');

  group('SaveCredentialsUseCaseImpl', () {
    test('Should delete a credential when the deleteCredential method is called ', () async {
      //*arrange
      when(() => repository.saveCredential(tCredrentials)).thenAnswer((_) async => Right(unit));
      //?act
      final response = await usecase(tCredrentials);
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(unit));
      verify(() => repository.saveCredential(tCredrentials)).called(1);
    });
    test('Should perform the title evaluation and return a ValidationFailure if the title is empty', () async {
      //?act
      final response = await usecase(const CredentialResult('', 'appId', 'token', 'id'));
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const ValidationCredentialFailure('O titulo não pode ser vazio.')));
      verifyNever(() => repository.saveCredential(const CredentialResult('', 'appId', 'token', 'id')));
    });
    test('Should perform the appId evaluation and return a ValidationCredentialFailure if the appId is empty', () async {
      //?act
      final response = await usecase(const CredentialResult('title', '', 'token', 'id'));
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const ValidationCredentialFailure('O appId não pode ser vazio.')));
      verifyNever(() => repository.saveCredential(const CredentialResult('', 'appId', 'token', 'id')));
    });
    test('Should perform the appId evaluation and return a ValidationCredentialFailure if the token is empty', () async {
      //?act
      final response = await usecase(const CredentialResult('title', 'appId', '', 'id'));
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const ValidationCredentialFailure('O token não pode ser vazio.')));
    });
  });
}
