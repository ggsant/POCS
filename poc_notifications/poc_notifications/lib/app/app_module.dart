import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/local_storage_service/hive_service.dart';
import 'core/local_storage_service/local_storage_service.dart';
import 'modules/send_notifications/domain/usecase/fetch_credential_usecase.dart';
import 'modules/send_notifications/notification_module.dart';
import 'modules/send_notifications/presenter/pages/home/home_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(
          i(),
        )),
    Bind.singleton<LocalStorageService>((i) => HiveService()),
    Bind.factory<FetchCredentialUseCase>((i) => FetchCredentialUseCaseImpl(i())),
    Bind.factory<Dio>((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: NotificationModule()),
  ];
}
