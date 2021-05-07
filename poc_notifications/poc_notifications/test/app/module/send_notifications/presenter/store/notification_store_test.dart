import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/send_notification_usecase.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/pages/notification/notification_store.dart';
import 'package:triple_test/triple_test.dart';

class SendNotificationUseCaseMock extends Mock implements SendNotificationUseCase {}

void main() {
  late SendNotificationUseCaseMock usecase;
  setUpAll(() {
    registerFallbackValue(NotificationParamsEmpty());
    usecase = SendNotificationUseCaseMock();
  });

  group('NotificationStore', () {
    storeTest<NotificationStore>(
      'Should call the store',
      build: () {
        when(() => usecase.call(any())).thenAnswer((_) async => Right(const NotificationResult('ok!')));
        return NotificationStore(usecase);
      },
      act: (store) => store.sendNotifications('title', 'body', CredentialResult('title', 'appId', 'token', 'id')),
      expect: () => [tripleState, true, const NotificationResult('ok!'), false],
      verify: (store) {
        verify(() => usecase.call(any())).called(1);
      },
    );

    storeTest<NotificationStore>(
      'Should return DataSourceFailure ',
      build: () {
        when(() => usecase.call(any())).thenAnswer((_) async => Left(const DataSourceNotificationFailure('Error')));
        return NotificationStore(usecase);
      },
      act: (store) => store.sendNotifications('title', 'body', CredentialResult('', '', '', '')),
      expect: () => [tripleState, true, const DataSourceNotificationFailure('Error'), false],
      verify: (store) {
        verify(() => usecase.call(any())).called(1);
      },
    );
  });
}
