import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_storage_service.dart';

const String credentialBoxName = "credentials_box";

class HiveService implements LocalStorageService {
  HiveService() {
    initHive();
  }

  final completer = Completer<Box>();

  Future<void> initHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    var credential = await Hive.openBox(credentialBoxName);
    completer.complete(credential);
  }

  @override
  Future<void> delete(String key) async {
    final box = await completer.future;
    await box.delete(key);
  }

  @override
  Future<List<Map>?> get(String key) async {
    final box = await completer.future;
    var response = await box.get(key);
    return response == null ? null : (response as List).map<Map>((e) => e).toList();
  }

  @override
  Future<void> save(String key, List<Map> value) async {
    final box = await completer.future;
    await box.put(key, value);
  }
}
