import 'package:dartz/dartz.dart';
import '../../domain/entities/credentials_result.dart';
import '../datasource/hive_datasource.dart';
import '../../domain/errors/credentials_failures/credential_failures.dart';
import '../../domain/repositories/credential_repository.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final HiveDataSouce dataSouce;

  const CredentialRepositoryImpl(this.dataSouce);

  @override
  Future<Either<CredentialFailures, Unit>> saveCredential(CredentialResult params) async {
    try {
      await dataSouce.saveCredential(params);
      return Right(unit);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, List<CredentialResult>>> fetchCredential() async {
    try {
      final credential = await dataSouce.fetchCredential();
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, Unit>> updateCredential(CredentialResult params) async {
    try {
      await dataSouce.updateCredential(params);
      return Right(unit);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, Unit>> deleteCredential(String id) async {
    try {
      await dataSouce.deleteCredential(id);
      return Right(unit);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }
}
