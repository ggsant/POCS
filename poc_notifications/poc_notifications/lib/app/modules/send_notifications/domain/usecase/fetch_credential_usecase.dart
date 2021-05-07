import 'package:dartz/dartz.dart';
import '../entities/credentials_result.dart';
import '../repositories/credential_repository.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class FetchCredentialUseCase {
  Future<Either<CredentialFailures, List<CredentialResult>>> call();
}

class FetchCredentialUseCaseImpl implements FetchCredentialUseCase {
  final CredentialRepository repository;

  const FetchCredentialUseCaseImpl(this.repository);

  Future<Either<CredentialFailures, List<CredentialResult>>> call() async {
    return await repository.fetchCredential();
  }
}
