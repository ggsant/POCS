class CredentialResult {
  final String title;
  final String appId;
  final String token;

  const CredentialResult(this.title, this.appId, this.token);
}

class CredentialResultEmpty extends CredentialResult {
  const CredentialResultEmpty() : super('', '', '');
}
