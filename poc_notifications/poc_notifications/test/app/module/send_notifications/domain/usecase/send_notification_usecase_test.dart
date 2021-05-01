import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/send_notification_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/send_notification_usecase.dart';

class MockSendNotificationRepository extends Mock implements SendNotificationRepository {}

void main() {
  late MockSendNotificationRepository repository;
  late SendNotificationUseCaseImpl usecase;
  setUpAll(() {
    repository = MockSendNotificationRepository();
    usecase = SendNotificationUseCaseImpl(repository);
  });

  group('SendNotificaionUseCaseImpl', () {
    //todo: testar validação
    test('Should send Notifications', () async {
      //?act
      final response = await usecase(NotificationParamsEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(const NotificationResult('Nenhum parâmetro foi especificado.')));
    });
  });
}
