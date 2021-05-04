import 'package:dartz/dartz.dart';
import '../entities/credentials_result.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class CredentialRepository {
  Future<Either<CredentialFailures, CredentialResult>> saveCredential(
      CredentialResult params);
  Future<Either<CredentialFailures, CredentialResult>> fetchCredential(
      CredentialResult params);
  Future<Either<CredentialFailures, CredentialResult>> deleteCredential(
      CredentialResult params);
  Future<Either<CredentialFailures, CredentialResult>> updateCredential(
      CredentialResult params);
}
