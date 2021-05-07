import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/core/local_storage_service/local_storage_service.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/adapters/credential_adapters.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/hive_datasource_impl.dart';

class LocalStorageServiceMock extends Mock implements LocalStorageService {}

const LIST_CREDENTIAL_KEY = 'LIST_CREDENTIAL_KEY';

void main() {
  late LocalStorageServiceMock service;
  late HiveDataSouceImpl dataSource;

  setUp(() {
    service = LocalStorageServiceMock();
    dataSource = HiveDataSouceImpl(service);
  });

  final tCredrential = CredentialResult('title', 'appId', 'token', 'id');

  List<Map> tCredrentialList = [CredentialAdapters.toJson(tCredrential)];

  group('HiveDataSouceImpl', () {
    test('Should saveCredential', () async {
      //*arrange
      when(() => service.get(LIST_CREDENTIAL_KEY)).thenAnswer((_) async => []);
      when(() => service.save(LIST_CREDENTIAL_KEY, tCredrentialList)).thenAnswer((_) async => _);
      //?act
      await dataSource.saveCredential(tCredrential);
      //!assert
      verify(() => service.save(LIST_CREDENTIAL_KEY, tCredrentialList)).called(1);
    });
    test('fetchCredential ', () async {
      //*arrange
      when(() => service.get(LIST_CREDENTIAL_KEY)).thenAnswer((_) async => []);
      //?act
      await dataSource.fetchCredential();
      //!assert
      verify(() => service.get(LIST_CREDENTIAL_KEY)).called(1);
    });
    group('description', () {
      test('updateCredential - index credential is negative  ', () async {
        //*arrange
        when(() => service.get(LIST_CREDENTIAL_KEY)).thenAnswer((_) async => []);
        when(() => service.save(LIST_CREDENTIAL_KEY, tCredrentialList)).thenAnswer((_) async => _);
        //?act
        await dataSource.updateCredential(tCredrential);
        //!assert
        verify(() => service.save(LIST_CREDENTIAL_KEY, tCredrentialList)).called(1);
      });
      test('updateCredential - index ok  ', () async {
        //*arrange
        when(() => service.get(LIST_CREDENTIAL_KEY)).thenAnswer((_) async => tCredrentialList);
        when(() => service.save(LIST_CREDENTIAL_KEY, tCredrentialList)).thenAnswer((_) async => _);
        //?act
        await dataSource.updateCredential(tCredrential);
        //!assert
        verify(() => service.save(LIST_CREDENTIAL_KEY, tCredrentialList)).called(1);
      });
    });
  });
}
