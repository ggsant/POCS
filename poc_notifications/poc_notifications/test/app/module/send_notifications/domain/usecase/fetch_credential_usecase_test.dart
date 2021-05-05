import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/credential_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/fetch_credential_usecase.dart';

class CredentialRepositoryMock extends Mock implements CredentialRepository {}

void main() {
  late CredentialRepositoryMock repository;
  late FetchCredentialUseCaseImpl usecase;
  setUpAll(() {
    repository = CredentialRepositoryMock();
    usecase = FetchCredentialUseCaseImpl(repository);
  });

  group('FetchCredentialUseCaseImpl', () {
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
      final response = await usecase(const CredentialResultHiveEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(
          response,
          Right(const CredentialResultHive(
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
          await usecase(const CredentialResultHive('', 'appId', 'token', 'id'));
      //!assert
      expect(response.isLeft(), true);
      expect(
          response,
          Left(const ValidationCredentialFailure(
            'O titulo não pode ser vazio.',
          )));
    });
  });
}
