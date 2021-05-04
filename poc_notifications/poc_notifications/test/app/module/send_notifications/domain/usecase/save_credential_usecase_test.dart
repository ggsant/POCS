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

  group('SaveCredentialsUseCaseImpl', () {
    // test(
    //     'Should return a NotificationResult(Ok!) when parameters are called correctly',
    //     () async {
    //   //*arrange
    //   when(() => repository.saveCredential(const NotificationParams(
    //       appId: 'appId', body: 'body', title: 'title', token: 'token')));
    //   //?act
    //   final response = await usecase(const NotificationParams(
    //       appId: 'appId', body: 'body', title: 'title', token: 'token'));
    //   //!assert
    //   expect(response.isRight(), true);
    // });
    test(
        'Should return a CredentialResult when parameters are called with CredentialResultEmpty',
        () async {
      //?act
      final response = await usecase(const CredentialResultEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(
          response,
          Right(const CredentialResult(
            'Nenhum parâmetro foi especificado para o id.',
            'Nenhum parâmetro foi especificado para o titulo.',
            'Nenhum parâmetro foi especificado para o appId.',
            'Nenhum parâmetro foi especificado para o token.',
          )));
    });

    test(
        'Should perform the title evaluation and return a ValidationFailure if the title is empty',
        () async {
      //?act
      final response =
          await usecase(const CredentialResult('', 'appId', 'token', ''));
      //!assert
      expect(response.isLeft(), true);
      expect(
          response,
          Left(const ValidationCredentialFailure(
            'O titulo não pode ser vazio.',
          )));
    });
    test(
        'Should perform the appId evaluation and return a ValidationCredentialFailure if the appId is empty',
        () async {
      //?act
      final response =
          await usecase(const CredentialResult('title', '', 'token', 'id'));
      //!assert
      expect(response.isLeft(), true);
      expect(
          response,
          Left(const ValidationCredentialFailure(
            'O appId não pode ser vazio.',
          )));
    });
    test(
        'Should perform the appId evaluation and return a ValidationCredentialFailure if the token is empty',
        () async {
      //?act
      final response =
          await usecase(const CredentialResult('title', 'appId', '', 'id'));
      //!assert
      expect(response.isLeft(), true);
      expect(
          response,
          Left(const ValidationCredentialFailure(
            'O token não pode ser vazio.',
          )));
    });
  });
}
