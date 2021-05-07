import '../../domain/entities/credentials_result.dart';

abstract class HiveDataSouce {
  Future<void> saveCredential(CredentialResult params);
  Future<List<CredentialResult>> fetchCredential();
  Future<void> updateCredential(CredentialResult params);
  Future<void> deleteCredential(String id);
}
