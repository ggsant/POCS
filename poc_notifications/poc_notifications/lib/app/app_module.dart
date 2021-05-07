import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/local_storage_service/hive_service.dart';
import 'core/local_storage_service/local_storage_service.dart';
import 'modules/send_notifications/notification_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<LocalStorageService>((i) => HiveService()),
    Bind.factory<Dio>((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: NotificationModule()),
  ];
}
