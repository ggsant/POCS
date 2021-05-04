import 'package:dartz/dartz.dart';
import '../datasource/hive_datasource.dart';
import '../../domain/errors/credentials_failures/credential_failures.dart';
import '../../domain/entities/credentials_result.dart';
import '../../domain/repositories/credential_repository.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final HiveDataSouce dataSouce;

  const CredentialRepositoryImpl(this.dataSouce);
  @override
  Future<Either<CredentialFailures, CredentialResult>> fetchCredential(
      CredentialResult params) async {
    try {
      final credential = await dataSouce.fetchCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, CredentialResult>> saveCredential(
      CredentialResult params) async {
    try {
      final credential = await dataSouce.saveCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }
}
