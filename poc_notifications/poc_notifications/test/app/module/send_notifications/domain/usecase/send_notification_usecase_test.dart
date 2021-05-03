import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
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
    test('Should return a NotificationResult(Ok!) when parameters are called correctly', () async {
      //* arrange
      when(() => repository.sendNotifications(const NotificationParams(appId: 'appId', body: 'body', title: 'title', token: 'token'))).thenAnswer((_) async => Right(const NotificationResult('Ok!')));
      //?act
      final response = await usecase(
        const NotificationParams(appId: 'appId', body: 'body', title: 'title', token: 'token'),
      );
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(const NotificationResult('Ok!')));
    });
    test('Should return a NotificationResult(Nenhum parâmetro foi especificado.) when parameters are called correctly', () async {
      //?act
      final response = await usecase(NotificationParamsEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(const NotificationResult('Nenhum parâmetro foi especificado.')));
    });
    test('Should perform the body evaluation and return a ValidationFailure if the body is empty', () async {
      //?act
      final response = await usecase(NotificationParams(body: '', appId: 'appId', title: 'title', token: ''));
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const ValidationFailure('O body não pode ser vazio.')));
    });
    test('Should perform the title evaluation and return a ValidationFailure if the title is empty', () async {
      //?act
      final response = await usecase(NotificationParams(body: 'body', appId: 'appId', title: '', token: ''));
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const ValidationFailure('O titulo não pode ser vazio.')));
    });
    test('Should perform the appId evaluation and return a ValidationFailure if the appId is empty', () async {
      //?act
      final response = await usecase(NotificationParams(body: 'body', appId: '', title: 'title', token: ''));
      //!assert
      expect(response.isLeft(), true);
      expect(response, Left(const ValidationFailure('O appId não pode ser vazio.')));
    });
  });
}
