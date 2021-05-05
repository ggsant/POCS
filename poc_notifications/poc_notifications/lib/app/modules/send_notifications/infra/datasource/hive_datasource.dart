import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';

abstract class HiveDataSouce {
  Future<void> saveCredential(CredentialResultHive params);
  Future<void> updateCredential(CredentialResultHive params);
  Future<void> deleteCredential(CredentialResultHive params);
  Future<List<CredentialResultHive>> fetchCredential(
      CredentialResultHive params);
}
