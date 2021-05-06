import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/credential_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/delete_credential_usecase.dart';

class CredentialRepositoryMock extends Mock implements CredentialRepository {}

void main() {
  late CredentialRepositoryMock repository;
  late DeleteCredentialUseCase usecase;
  setUpAll(() {
    repository = CredentialRepositoryMock();
    usecase = DeleteCredentialUseCase(repository);
  });

  group('DeleteCredentialUseCaseImpl', () {
    test('Should perform the title evaluation and return a ValidationFailure if the title is empty', () async {
      //?act
      final response = await usecase('');
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const EmptyCredentialFieldFailure('credentialId')));
    });
  });
}
