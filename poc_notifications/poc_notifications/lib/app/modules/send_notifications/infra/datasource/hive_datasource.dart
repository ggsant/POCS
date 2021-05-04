import '../../domain/entities/credentials_result.dart';

abstract class HiveDataSouce {
  Future<CredentialResult> saveCredential(CredentialResult params);
  Future<CredentialResult> fetchCredential(CredentialResult params);
  Future<CredentialResult> deleteCredential(CredentialResult params);
}
