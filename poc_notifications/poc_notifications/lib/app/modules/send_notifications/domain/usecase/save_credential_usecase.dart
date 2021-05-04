import 'package:dartz/dartz.dart';
import '../repositories/credential_repository.dart';
import '../entities/credentials_result.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class SaveCredentialsUseCase {
  Future<Either<CredentialFailures, CredentialResult>> call(
      CredentialResult params);
}

class SaveCredentialsUseCaseImpl implements SaveCredentialsUseCase {
  final CredentialRepository repository;

  const SaveCredentialsUseCaseImpl(this.repository);
  @override
  Future<Either<CredentialFailures, CredentialResult>> call(
      CredentialResult params) async {
    if (params is CredentialResultEmpty) {
      return Right(const CredentialResult(
        'Nenhum parâmetro foi especificado para o titulo.',
        'Nenhum parâmetro foi especificado para o appId.',
        'Nenhum parâmetro foi especificado para o token.',
      ));
    }

    if (params.title.isEmpty) {
      return Left(
          const ValidationCredentialFailure('O titulo não pode ser vazio.'));
    } else if (params.appId.isEmpty) {
      return Left(
          const ValidationCredentialFailure('O appId não pode ser vazio.'));
    } else if (params.token.isEmpty) {
      return Left(
          const ValidationCredentialFailure('O token não pode ser vazio.'));
    }

    return await repository.saveCredential(params);
  }
}
