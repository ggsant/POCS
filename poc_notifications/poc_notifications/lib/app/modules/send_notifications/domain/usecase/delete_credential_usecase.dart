import 'package:dartz/dartz.dart';
import '../repositories/credential_repository.dart';
import '../errors/credentials_failures/credential_failures.dart';

class DeleteCredentialUseCase {
  final CredentialRepository repository;

  const DeleteCredentialUseCase(this.repository);

  Future<Either<CredentialFailures, Unit>> call(String credentialId) async {
    if (credentialId.isEmpty) {
      return Left(const EmptyCredentialFieldFailure('credentialId'));
    }

    return await repository.deleteCredential(credentialId);
  }
}
