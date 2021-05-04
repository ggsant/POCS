import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecase/send_notification_usecase.dart';
import 'external/datasource/send_notification_datasource_impl.dart';
import 'infra/datasource/send_notification.dart';
import 'infra/repositories/send_notifications_repository.dart';
import 'presenter/notification_page.dart';
import 'presenter/notification_store.dart';

import 'domain/repositories/send_notification_repository.dart';

class NotificationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<NotificationStore>((i) => NotificationStore(i())),
    Bind.factory<SendNotificationUseCase>(
        (i) => SendNotificationUseCaseImpl(i())),
    Bind.factory<SendNotificationRepository>(
        (i) => SendNotificationRepositoryImpl(i())),
    Bind.factory<SendNotificationDataSouce>(
        (i) => SendNotificationDataSouceImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => NotificationPage()),
  ];
}
