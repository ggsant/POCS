class CredentialResult {
  final String id;
  final String title;
  final String appId;
  final String token;

  const CredentialResult(this.title, this.appId, this.token, this.id);

  factory CredentialResult.empty() => const CredentialResult('', '', '', '');
}
