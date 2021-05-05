import 'package:poc_notifications/app/core/hive_service/hive_service.dart';

import '../../domain/entities/credentials_result.dart';
import '../../infra/datasource/hive_datasource.dart';

class HiveDataSouceImpl implements HiveDataSouce {
  final HiveService service;

  const HiveDataSouceImpl(this.service);
  @override
  Future<CredentialResult> deleteCredential(CredentialResult params) async {
    for (int i = 0; i < service.credential!.length; i++) {
      if (service.credential!.getAt(i).id == params.id) {
        await service.credential!.deleteAt(i);
        break;
      }
    }
    return CredentialResultEmpty();
  }

  @override
  Future<CredentialResult> fetchCredential(CredentialResult params) async {
    for (var i = 0; i < service.credential!.length; i++) {
      if (service.credential!.getAt(i).id == params.id) {
        await service.credential!.getAt(i);
      }
    }
    return CredentialResult('${params.title}', '${params.appId}',
        '${params.token}', '${params.id}');
  }

  @override
  Future<CredentialResult> saveCredential(CredentialResult params) async {
    await service.credential!.add(params);

    return CredentialResultEmpty();
  }

  @override
  Future<CredentialResult> updateCredential(CredentialResult params) async {
    await service.credential!.putAt(int.parse(params.id), params);
    return CredentialResultEmpty();
  }
}
