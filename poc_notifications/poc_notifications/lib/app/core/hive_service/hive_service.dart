import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../modules/send_notifications/domain/entities/credentials_result.dart';
import 'adapters/credential_adapter.dart';

const String credentialBoxName = "credentials_box";

class HiveService {
  HiveService() {
    initHive();
  }

  Box? credential;

  Future<bool> initHive() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
      Hive.registerAdapter<CredentialResult>(CredentialResultAdapter());
      credential = await Hive.openBox<CredentialResult>(credentialBoxName);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
