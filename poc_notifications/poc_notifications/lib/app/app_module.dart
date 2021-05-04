import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/hive_service/hive_service.dart';
import 'modules/send_notifications/notification_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<HiveService>((i) => HiveService()),
    Bind.factory<Dio>((i) => Dio())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: NotificationModule()),
  ];
}
