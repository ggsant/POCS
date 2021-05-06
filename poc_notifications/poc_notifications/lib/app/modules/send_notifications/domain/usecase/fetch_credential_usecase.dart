import 'package:dartz/dartz.dart';
import '../entities/credentials_result.dart';
import '../repositories/credential_repository.dart';
import '../errors/credentials_failures/credential_failures.dart';

class FetchCredentialUseCase {
  final CredentialRepository repository;

  const FetchCredentialUseCase(this.repository);

  Future<Either<CredentialFailures, List<CredentialResult>>> call(String credentialName) async {
    if (credentialName.isEmpty) {
      return Left(const EmptyCredentialFieldFailure('credentialName'));
    }

    return await repository.fetchCredential(credentialName);
  }
}
