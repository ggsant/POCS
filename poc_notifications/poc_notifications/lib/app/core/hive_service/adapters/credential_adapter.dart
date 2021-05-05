import 'package:hive/hive.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';

part 'credential_adapter.g.dart';

@HiveType(typeId: 0)
class CredentialResultHive extends CredentialResult {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String appId;
  @HiveField(3)
  final String token;
  CredentialResultHive(this.title, this.appId, this.token, this.id)
      : super(title, appId, token, id);
}
