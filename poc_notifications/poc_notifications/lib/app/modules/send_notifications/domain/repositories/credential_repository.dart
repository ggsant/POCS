import 'package:dartz/dartz.dart';
import '../entities/credentials_result.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class CredentialRepository {
  Future<Either<CredentialFailures, Unit>> saveCredential(CredentialResult params);
  Future<Either<CredentialFailures, List<CredentialResult>>> fetchCredential();
  Future<Either<CredentialFailures, Unit>> updateCredential(CredentialResult params);
  Future<Either<CredentialFailures, Unit>> deleteCredential(String id);
}
