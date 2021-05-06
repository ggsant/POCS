import 'package:dartz/dartz.dart';
import '../../domain/entities/credentials_result.dart';
import '../datasource/hive_datasource.dart';
import '../../domain/errors/credentials_failures/credential_failures.dart';
import '../../domain/repositories/credential_repository.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final HiveDataSouce dataSouce;

  const CredentialRepositoryImpl(this.dataSouce);

  @override
  Future<Either<CredentialFailures, CredentialResult>> saveCredential(CredentialResult params) async {
    try {
      final credential = await dataSouce.saveCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, List<CredentialResult>>> fetchCredential(String credentialName) async {
    try {
      final credential = await dataSouce.fetchCredential(credentialName);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, Unit>> updateCredential(CredentialResult params) async {
    try {
      final credential = await dataSouce.updateCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, Unit>> deleteCredential(String id) async {
    try {
      final credential = await dataSouce.deleteCredential(id);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }
}
