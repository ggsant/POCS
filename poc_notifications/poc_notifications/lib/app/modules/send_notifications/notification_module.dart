import 'package:poc_notifications/app/modules/send_notifications/presenter/pages/credential_register/credential_register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecase/save_credential_usecase.dart';
import 'domain/usecase/send_notification_usecase.dart';
import 'domain/usecase/update_credential_usecase.dart';
import 'external/datasource/send_notification_datasource_impl.dart';
import 'infra/datasource/send_notification.dart';
import 'infra/repositories/send_notifications_repository.dart';
import 'presenter/pages/credential_register/credential_register_store.dart';
import 'presenter/pages/notification/notification_page.dart';
import 'presenter/pages/notification/notification_store.dart';

import 'domain/repositories/send_notification_repository.dart';

class NotificationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<NotificationStore>((i) => NotificationStore(i())),
    Bind.singleton<CredentialRegisterStore>((i) => CredentialRegisterStore(i(), i())),
    Bind.factory<SaveCredentialsUseCase>((i) => SaveCredentialsUseCaseImpl(i())),
    Bind.factory<UpdateCredentialsUseCase>((i) => UpdateCredentialsUseCaseImpl(i())),
    Bind.factory<SendNotificationUseCase>((i) => SendNotificationUseCaseImpl(i())),
    Bind.factory<SendNotificationRepository>((i) => SendNotificationRepositoryImpl(i())),
    Bind.factory<SendNotificationDataSouce>((i) => SendNotificationDataSouceImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/credential_register', child: (_, args) => CredentialRegisterPage()),
    ChildRoute('/', child: (_, __) => NotificationPage()),
  ];
}
