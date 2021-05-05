import 'package:dartz/dartz.dart';
import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
import '../errors/credentials_failures/credential_failures.dart';

abstract class CredentialRepository {
  Future<Either<CredentialFailures, void>> saveCredential(
      CredentialResultHive params);
  Future<Either<CredentialFailures, void>> updateCredential(
      CredentialResultHive params);
  Future<Either<CredentialFailures, void>> deleteCredential(
      CredentialResultHive params);
  Future<Either<CredentialFailures, List<CredentialResultHive>>>
      fetchCredential(CredentialResultHive params);
}
