import 'package:hive/hive.dart';

part 'credentials_result.g.dart';

@HiveType(typeId: 1)
class CredentialResult {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String appId;

  @HiveField(3)
  final String token;

  const CredentialResult(this.title, this.appId, this.token, this.id);
}

class CredentialResultEmpty extends CredentialResult {
  const CredentialResultEmpty() : super('', '', '', '');
}
