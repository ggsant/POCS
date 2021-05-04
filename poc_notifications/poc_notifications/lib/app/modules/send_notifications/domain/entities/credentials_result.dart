import 'package:uuid/uuid.dart';

class CredentialResult {
  final String id;
  final String title;
  final String appId;
  final String token;

  const CredentialResult(this.title, this.appId, this.token, this.id);
}

class CredentialResultEmpty extends CredentialResult {
  const CredentialResultEmpty() : super('', '', '', '');
}
