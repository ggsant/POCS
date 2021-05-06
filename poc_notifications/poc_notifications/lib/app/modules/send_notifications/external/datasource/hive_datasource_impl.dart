import 'package:dartz/dartz.dart';

import '../../../../core/hive_service/hive_service.dart';
import '../../domain/entities/credentials_result.dart';

import '../../infra/datasource/hive_datasource.dart';

class HiveDataSouceImpl implements HiveDataSouce {
  final HiveService service;

  const HiveDataSouceImpl(this.service);

  @override
  Future<CredentialResult> saveCredential(CredentialResult params) async {
    await service.credential!.put(params.id, params);
    return CredentialResult(params.title, params.appId, params.token, params.id);
  }

  @override
  Future<List<CredentialResult>> fetchCredential(String credentialName) async {
    final resultIds = service.credential!.keys;

    List<CredentialResult> credentialResult = [];

    resultIds.forEach((resultId) {
      credentialResult.add(service.credential!.get(resultId));
    });

    return credentialResult;
  }

  @override
  Future<Unit> updateCredential(CredentialResult params) async {
    await service.credential!.put(params.id, params);
    return unit;
  }

  @override
  Future<Unit> deleteCredential(String id) async {
    await service.credential!.delete(id);
    return unit;
  }
}
