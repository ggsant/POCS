import 'package:dartz/dartz.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/credential_repository.dart';
import '../entities/credentials_result.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class DeleteCredentialUseCase {
  Future<Either<CredentialFailures, CredentialResult>> call(
      CredentialResult params);
}

class DeleteCredentialUseCaseImpl implements DeleteCredentialUseCase {
  final CredentialRepository repository;

  const DeleteCredentialUseCaseImpl(this.repository);

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
        const ValidationCredentialFailure('O titulo não pode ser vazio.'),
      );
    }

    return await repository.deleteCredential(params);
  }
}
