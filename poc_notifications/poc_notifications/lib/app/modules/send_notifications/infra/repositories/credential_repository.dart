import 'package:dartz/dartz.dart';
import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
import '../datasource/hive_datasource.dart';
import '../../domain/errors/credentials_failures/credential_failures.dart';
import '../../domain/repositories/credential_repository.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final HiveDataSouce dataSouce;

  const CredentialRepositoryImpl(this.dataSouce);

  @override
  Future<Either<CredentialFailures, void>> saveCredential(
      CredentialResultHive params) async {
    try {
      final credential = await dataSouce.saveCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, void>> updateCredential(
      CredentialResultHive params) async {
    try {
      final credential = await dataSouce.updateCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, void>> deleteCredential(
      CredentialResultHive params) async {
    try {
      final credential = await dataSouce.deleteCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CredentialFailures, List<CredentialResultHive>>>
      fetchCredential(CredentialResultHive params) async {
    try {
      final credential = await dataSouce.fetchCredential(params);
      return Right(credential);
    } on CredentialFailures catch (e) {
      return Left(e);
    }
  }
}
