import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/fetch_credential_usecase.dart';

class HomeStore extends NotifierStore<CredentialFailures, List<CredentialResult>> {
  final FetchCredentialUseCase fetchUseCase;

  HomeStore(this.fetchUseCase) : super([]) {
    fetchCredentials();
  }

  Future<List<CredentialResult>?> fetchCredentials() async {
    final result = await fetchUseCase.call();
    executeEither(() async => result.map((r) => r));
  }
}
