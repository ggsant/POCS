import 'package:dartz/dartz.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/delete_credential_usecase.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/save_credential_usecase.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/update_credential_usecase.dart';
import 'package:uuid/uuid.dart';

class CredentialRegisterStore extends StreamStore<CredentialFailures, Unit> {
  final SaveCredentialsUseCase saveUsecase;
  final UpdateCredentialsUseCase updateUsecase;
  final DeleteCredentialUseCase deleteUsecase;

  CredentialRegisterStore(this.saveUsecase, this.updateUsecase, this.deleteUsecase) : super(unit);

  void saveCredentials(CredentialResult params) {
    var id = Uuid().v1();
    executeEither(() => params.id.isEmpty ? saveUsecase.call(params.copyWith(id: id)) : updateUsecase.call(params));
  }

  void deleteCredentials(CredentialResult params) {
    executeEither(() => deleteUsecase.call(params.id));
  }
}
