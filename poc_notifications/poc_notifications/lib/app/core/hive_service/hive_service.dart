import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../modules/send_notifications/domain/entities/credentials_result.dart';
import '../../modules/send_notifications/domain/entities/notification_result.dart';
import 'adapters/credential_adapter.dart';
import 'adapters/notification_adapter.dart';

const String notificationBoxName = "notifications";
const String credentialBoxName = "credentials";

class HiveService {
  HiveService() {
    initHive();
  }

  Box? credential;

  Box? notification;

  Future<bool> initHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter<NotificationResult>(NotificationResultHiveAdapter());
    Hive.registerAdapter<CredentialResult>(CredentialResultAdapter());
    notification = await Hive.openBox<NotificationResult>(notificationBoxName);
    credential = await Hive.openBox<CredentialResult>(credentialBoxName);
    return true;
  }
}
