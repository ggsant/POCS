import 'package:dartz/dartz.dart';
import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
import '../repositories/credential_repository.dart';
import '../entities/credentials_result.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class UpdateCredentialsUseCase {
  Future<Either<CredentialFailures, void>> call(CredentialResultHive params);
}

class UpdateCredentialsUseCaseImpl implements UpdateCredentialsUseCase {
  final CredentialRepository repository;

  const UpdateCredentialsUseCaseImpl(this.repository);
  @override
  Future<Either<CredentialFailures, void>> call(
      CredentialResultHive params) async {
    if (params is CredentialResultHiveEmpty) {
      return Right(const CredentialResult(
        'Nenhum parâmetro foi especificado para o id.',
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

    return await repository.updateCredential(params);
  }
}
