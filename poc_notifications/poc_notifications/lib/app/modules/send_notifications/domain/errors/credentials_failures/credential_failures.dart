abstract class CredentialFailures {
  final String message;

  const CredentialFailures(this.message);

  @override
  String toString() {
    return "$runtimeType: $message";
  }
}

class ValidationCredentialFailure extends CredentialFailures {
  const ValidationCredentialFailure(String message) : super(message);
}

class DataSourceCredentialFailure extends CredentialFailures {
  const DataSourceCredentialFailure(String message) : super(message);
}

class EmptyCredentialFieldFailure extends CredentialFailures {
  const EmptyCredentialFieldFailure(String paramName) : super('O parâmetro $paramName não pode ser vazio.');
}
