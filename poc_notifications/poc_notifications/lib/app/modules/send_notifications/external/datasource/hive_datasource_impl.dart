import 'package:poc_notifications/app/core/hive_service/adapters/credential_adapter.dart';
import 'package:poc_notifications/app/core/hive_service/hive_service.dart';

import '../../infra/datasource/hive_datasource.dart';

class HiveDataSouceImpl implements HiveDataSouce {
  final HiveService service;

  const HiveDataSouceImpl(this.service);

  @override
  Future<void> saveCredential(CredentialResultHive result) async {
    await service.credential!.put(result.id, result);
  }

  @override
  Future<void> updateCredential(CredentialResultHive result) async {
    await service.credential!.put(result.id, result);
  }

  @override
  Future<void> deleteCredential(CredentialResultHive result) async {
    final resultIds = service.credential!.keys;

    await service.credential!.delete(resultIds);
  }

  @override
  Future<List<CredentialResultHive>> fetchCredential(
      CredentialResultHive result) async {
    final resultIds = service.credential!.keys;

    List<CredentialResultHive> credentialResult = [];

    resultIds.forEach((resultId) {
      credentialResult.add(service.credential!.get(resultId));
    });

    return credentialResult;
  }
}
