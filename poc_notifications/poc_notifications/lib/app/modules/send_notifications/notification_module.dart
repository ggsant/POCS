import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/send_notification_usecase.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/send_notification_datasource_impl.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/datasource/send_notification.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/repositories/send_notifications_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/notification_page.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/notification_store.dart';

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
    Bind.factory<Dio>((i) => Dio())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => NotificationPage()),
  ];
}
