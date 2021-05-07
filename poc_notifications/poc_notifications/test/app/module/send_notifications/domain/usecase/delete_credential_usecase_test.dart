import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/credential_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/delete_credential_usecase.dart';

class CredentialRepositoryMock extends Mock implements CredentialRepository {}

void main() {
  late CredentialRepositoryMock repository;
  late DeleteCredentialUseCaseImpl usecase;
  setUpAll(() {
    repository = CredentialRepositoryMock();
    usecase = DeleteCredentialUseCaseImpl(repository);
  });

  group('DeleteCredentialUseCaseImpl', () {
    test('Should delete a credential when the deleteCredential method is called ', () async {
      //*arrange
      when(() => repository.deleteCredential('credentialId')).thenAnswer((_) async => Right(unit));
      //?act
      final response = await usecase('credentialId');
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(unit));
      verify(() => repository.deleteCredential('credentialId')).called(1);
    });
    test('Should perform the title validation and return a EmptyCredentialFieldFailure if the credentialId is empty', () async {
      //?act
      final response = await usecase('');
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const EmptyCredentialFieldFailure('credentialId')));
      verifyNever(() => repository.deleteCredential(''));
    });
  });
}
