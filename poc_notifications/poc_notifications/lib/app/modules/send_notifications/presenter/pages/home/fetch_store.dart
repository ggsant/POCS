import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/fetch_credential_usecase.dart';

class FetchStore extends NotifierStore<CredentialFailures, List<CredentialResult>> {
  final FetchCredentialUseCase fetchUseCase;

  FetchStore(this.fetchUseCase) : super([]) {
    fetchCredentials();
  }

  void fetchCredentials() {
    executeEither(() => fetchUseCase());
  }
}
