import 'package:dartz/dartz.dart';

import '../../domain/entities/credentials_result.dart';

abstract class HiveDataSouce {
  Future<CredentialResult> saveCredential(CredentialResult params);
  Future<List<CredentialResult>> fetchCredential(String credentialName);
  Future<Unit> updateCredential(CredentialResult params);
  Future<Unit> deleteCredential(String id);
}
