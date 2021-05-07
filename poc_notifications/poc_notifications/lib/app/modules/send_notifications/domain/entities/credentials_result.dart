class CredentialResult {
  final String id;
  final String title;
  final String appId;
  final String token;

  const CredentialResult(this.title, this.appId, this.token, this.id);

  factory CredentialResult.empty() => const CredentialResult('', '', '', '');

  CredentialResult copyWith({
    String? id,
    String? title,
    String? appId,
    String? token,
  }) {
    return CredentialResult(
      id ?? this.id,
      title ?? this.title,
      appId ?? this.appId,
      token ?? this.token,
    );
  }
}
