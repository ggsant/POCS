import 'package:poc_notifications/app/core/local_storage_service/hive_service.dart';
import 'package:poc_notifications/app/core/local_storage_service/local_storage_service.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/hive_datasource_impl.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/datasource/hive_datasource.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/repositories/credential_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/pages/credential_register/credential_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/repositories/credential_repository.dart';
import 'domain/usecase/delete_credential_usecase.dart';
import 'domain/usecase/fetch_credential_usecase.dart';
import 'domain/usecase/save_credential_usecase.dart';
import 'domain/usecase/send_notification_usecase.dart';
import 'domain/usecase/update_credential_usecase.dart';
import 'external/datasource/send_notification_datasource_impl.dart';
import 'infra/datasource/send_notification.dart';
import 'infra/repositories/send_notifications_repository.dart';
import 'presenter/pages/credential_register/credential_register_store.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/pages/notification/notification_store.dart';

import 'domain/repositories/send_notification_repository.dart';

class NotificationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<NotificationStore>((i) => NotificationStore(i())),
    Bind.singleton<CredentialRegisterStore>((i) => CredentialRegisterStore(i(), i())),
    //repo
    Bind.factory<CredentialRepository>((i) => CredentialRepositoryImpl(i())),

    // data
    Bind.factory<HiveDataSouce>((i) => HiveDataSouceImpl(i())),
    Bind.factory<LocalStorageService>((i) => HiveService()),

    // usecase
    Bind.factory<SaveCredentialsUseCase>((i) => SaveCredentialsUseCaseImpl(i())),
    Bind.factory<UpdateCredentialsUseCase>((i) => UpdateCredentialsUseCaseImpl(i())),
    Bind.factory<DeleteCredentialUseCase>((i) => DeleteCredentialUseCaseImpl(i())),
    Bind.factory<FetchCredentialUseCase>((i) => FetchCredentialUseCaseImpl(i())),

    // send notifications
    Bind.factory<SendNotificationUseCase>((i) => SendNotificationUseCaseImpl(i())),
    Bind.factory<SendNotificationRepository>((i) => SendNotificationRepositoryImpl(i())),
    Bind.factory<SendNotificationDataSouce>((i) => SendNotificationDataSouceImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/credential_register', child: (_, args) => CredentialRegisterPage()),
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
