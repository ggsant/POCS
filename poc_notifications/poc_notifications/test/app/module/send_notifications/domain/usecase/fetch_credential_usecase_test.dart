import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
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

  final tCredrentials = [CredentialResult('title', 'appId', 'token', 'id')];

  group('FetchCredentialUseCaseImpl', () {
    test('Should delete a credential when the deleteCredential method is called ', () async {
      //*arrange
      when(() => repository.fetchCredential()).thenAnswer((_) async => Right(tCredrentials));
      //?act
      final response = await usecase();
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tCredrentials));
      verify(() => repository.fetchCredential()).called(1);
    });
  });
}
