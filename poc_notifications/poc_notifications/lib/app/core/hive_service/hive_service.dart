import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService() {
    initHive();
  }

  Future<void> initHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    //Hive.registerAdapter(ContactAdapter()); if work with model and specify type
  }
}
