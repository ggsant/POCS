import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/save_credential_usecase.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/update_credential_usecase.dart';
import 'package:uuid/uuid.dart';

class CredentialRegisterStore extends NotifierStore<CredentialFailures, bool> {
  final SaveCredentialsUseCase saveUsecase;
  final UpdateCredentialsUseCase updateUsecase;

  CredentialRegisterStore(this.saveUsecase, this.updateUsecase) : super(false);

  void saveCredentials(CredentialResult params) async {
    if (params.id.isEmpty) {
      var id = Uuid().v1();
      final result = await saveUsecase.call(params.copyWith(id: id));
      executeEither(() async => result.map((r) => true));
      print('foi sera ? -----------------------------------------');
    } else {
      final result = await updateUsecase.call(params);
      executeEither(() async => result.map((r) => true));
      print('foi sera ? ---------------------------------------33333--');
    }
  }
}
