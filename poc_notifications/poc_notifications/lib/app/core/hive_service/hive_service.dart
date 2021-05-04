import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../modules/send_notifications/domain/entities/credentials_result.dart';
import '../../modules/send_notifications/domain/entities/notification_result.dart';

const String notificationBoxName = "notifications";
const String credentialBoxName = "credentials";

class HiveService {
  HiveService() {
    initHive();
  }

  Future<void> initHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter<NotificationResult>(NotificationResultAdapter());
    Hive.registerAdapter<CredentialResult>(CredentialResultAdapter());
    await Hive.openBox<NotificationResult>(notificationBoxName);
    await Hive.openBox<CredentialResult>(credentialBoxName);
  }
}
