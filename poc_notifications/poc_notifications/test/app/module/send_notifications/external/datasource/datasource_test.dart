import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/send_notification_impl.dart';

class MockDio extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() {
  late MockDio client;
  late SendNotificationDataSouceImpl datasource;
  late RequestOptionsMock _requestOptionsMock;

  setUpAll(() {
    client = MockDio();
    datasource = SendNotificationDataSouceImpl(client);
    _requestOptionsMock = RequestOptionsMock();
  });

  final tData = {
    "app_id": 'params.appId',
    "included_segments": ["Subscribed Users"],
    "headings": {"en": 'params.title'},
    "contents": {"en": 'params.body'}
  };

  group('SendNotificationDataSouceImpl', () {
    test('Should call the sendNotifications method and retur the NotificationResult', () async {
      when(
        () => client.post(any(), data: any(named: 'data'), options: any(named: 'options')),
      ).thenAnswer((_) async => Response(requestOptions: _requestOptionsMock, statusCode: HttpStatus.ok, data: tData));

      final response = await datasource.sendNotifications(NotificationParamsEmpty());

      expect(response, isA<NotificationResult>());
      verify(() => client.post(any(), data: any(named: 'data'), options: any(named: 'options'))).called(1);
    });

    test('Should return an error of DataSourceFailure ', () async {
      //*arrange
      when(
        () => client.post(any(), data: any(named: 'data'), options: any(named: 'options')),
      ).thenAnswer((_) async => Response(requestOptions: _requestOptionsMock, statusCode: HttpStatus.badRequest, data: tData));
      //?act
      final response = datasource.sendNotifications(NotificationParamsEmpty());
      //!assert
      //erro capcioso colocar () => quando for testar erro
      expect(() => response, throwsA(isA<DataSourceFailure>()));
      verify(() => client.post(any(), data: any(named: 'data'), options: any(named: 'options'))).called(1);
    });
  });
}
