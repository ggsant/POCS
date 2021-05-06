import 'package:hive/hive.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';

part 'credential_adapter.g.dart';

@HiveType(adapterName: 'CredentialAdapter', typeId: 0)
class CredentialResultHive implements CredentialResult {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String appId;
  @HiveField(3)
  final String token;
  const CredentialResultHive(this.title, this.appId, this.token, this.id) : super();
}

class CredentialResultHiveEmpty extends CredentialResult {
  const CredentialResultHiveEmpty() : super('', '', '', '');
}
