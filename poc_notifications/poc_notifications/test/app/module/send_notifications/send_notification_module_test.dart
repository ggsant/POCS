import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/notification_module.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/pages/notification/notification_store.dart';
import 'package:triple_test/triple_test.dart';

class MockDio extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() {
  final dio = MockDio();
  final _requestOptionsMock = RequestOptionsMock();

  setUpAll(() {
    initModule(NotificationModule(), replaceBinds: [Bind.factory<MockDio>((i) => dio)], initialModule: true);
  });

  tearDown(() {
    Modular.dispose<NotificationStore>();
  });

  final tData = {
    "app_id": 'params.appId',
    "included_segments": ["Subscribed Users"],
    "headings": {"en": 'params.title'},
    "contents": {"en": 'params.body'}
  };

  group('description', () {
    storeTest<NotificationStore>(
      'Should call the store',
      build: () {
        when(
          () => dio.post(any(), data: any(named: 'data'), options: any(named: 'options')),
        ).thenAnswer((_) async => Response(requestOptions: _requestOptionsMock, statusCode: HttpStatus.ok, data: tData));
        return Modular.get<NotificationStore>();
      },
      act: (store) => store.sendNotifications('title', 'body', CredentialResult('title', 'appId', 'token', 'id')),
      expect: () => [tripleState, true, const NotificationResult('Ok!'), false],
    );

    storeTest<NotificationStore>(
      'Should return DataSourceFailure ',
      build: () {
        when(
          () => dio.post(any(), data: any(named: 'data'), options: any(named: 'options')),
        ).thenAnswer((_) async => Response(requestOptions: _requestOptionsMock, statusCode: HttpStatus.badRequest, data: tData));
        return Modular.get<NotificationStore>();
      },
      act: (store) => store.sendNotifications('title', 'body', CredentialResult('title', 'appId', 'token', 'id')),
      expect: () => [tripleState, true, const DataSourceNotificationFailure('Ocorreu um erro no datasource'), false],
    );
  });
}
