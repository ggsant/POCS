import 'package:dartz/dartz.dart';
import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
import '../repositories/credential_repository.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class FetchCredentialUseCase {
  Future<Either<CredentialFailures, List<CredentialResultHive>>> call(
      CredentialResultHive params);
}

class FetchCredentialUseCaseImpl implements FetchCredentialUseCase {
  final CredentialRepository repository;

  const FetchCredentialUseCaseImpl(this.repository);

  @override
  Future<Either<CredentialFailures, List<CredentialResultHive>>> call(
      CredentialResultHive params) async {
    if (params is CredentialResultHiveEmpty) {
      return Right([
        CredentialResultHive(
          'Nenhum parâmetro foi especificado para o id.',
          'Nenhum parâmetro foi especificado para o titulo.',
          'Nenhum parâmetro foi especificado para o appId.',
          'Nenhum parâmetro foi especificado para o token.',
        ),
      ]);
    }

    if (params.title.isEmpty) {
      return Left(
        const ValidationCredentialFailure('O titulo não pode ser vazio.'),
      );
    }

    return await repository.fetchCredential(params);
  }
}
