import 'package:poc_notifications/app/core/local_storage_service/local_storage_service.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/adapters/credential_adapters.dart';
import '../../domain/entities/credentials_result.dart';
import '../../infra/datasource/hive_datasource.dart';

const LIST_CREDENTIAL_KEY = 'LIST_CREDENTIAL_KEY';

class HiveDataSouceImpl implements HiveDataSouce {
  final LocalStorageService service;

  const HiveDataSouceImpl(this.service);

  @override
  Future<void> saveCredential(CredentialResult params) async {
    var listCredential = await service.get(LIST_CREDENTIAL_KEY) ?? [];
    listCredential.insert(0, CredentialAdapters.toJson(params));
    await service.save(LIST_CREDENTIAL_KEY, listCredential);
  }

  @override
  Future<List<CredentialResult>> fetchCredential() async {
    var listCredential = await service.get(LIST_CREDENTIAL_KEY) ?? [];
    return listCredential.map((e) => CredentialAdapters.fromJson(e)).toList();
  }

  @override
  Future<void> updateCredential(CredentialResult params) async {
    var listCredential = await service.get(LIST_CREDENTIAL_KEY) ?? [];
    var indexCredential = listCredential.indexWhere((element) => element['id'] == params.id);
    if (indexCredential.isNegative) {
      listCredential.add(CredentialAdapters.toJson(params));
    } else {
      listCredential[indexCredential] = CredentialAdapters.toJson(params);
    }
    await service.save(LIST_CREDENTIAL_KEY, listCredential);
  }

  @override
  Future<void> deleteCredential(String id) async {
    var listCredential = await service.get(LIST_CREDENTIAL_KEY) ?? [];
    listCredential.removeWhere((element) => element['id'] == id);
    await service.save(LIST_CREDENTIAL_KEY, listCredential);
  }
}
