import '../../domain/entities/credentials_result.dart';
import '../../infra/datasource/hive_datasource.dart';

enum Credential {
  INSERT,
  FETCH,
  DELETE,
}

class HiveDataSouceImpl implements HiveDataSouce {
  @override
  Future<CredentialResult> deleteCredential(CredentialResult params) {
    // TODO: implement deleteCredential
    throw UnimplementedError();
  }

  @override
  Future<CredentialResult> fetchCredential(CredentialResult params) {
    // TODO: implement fetchCredential
    throw UnimplementedError();
  }

  @override
  Future<CredentialResult> saveCredential(CredentialResult params) {
    // TODO: implement saveCredential
    throw UnimplementedError();
  }

  @override
  Future<CredentialResult> updateCredential(CredentialResult params) {
    // TODO: implement updateCredential
    throw UnimplementedError();
  }
}
