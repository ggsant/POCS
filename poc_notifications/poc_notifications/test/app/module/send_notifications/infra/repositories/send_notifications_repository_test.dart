import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/datasource/send_notification_impl.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/models/notification_model.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/repositories/send_notifications_repository.dart';

class SendNotificationDataSouceImplMock extends Mock implements SendNotificationDataSouceImpl {}

void main() {
  late SendNotificationDataSouceImplMock datasource;
  late SendNotificationRepositoryImpl repository;
  setUpAll(() {
    datasource = SendNotificationDataSouceImplMock();
    repository = SendNotificationRepositoryImpl(datasource);
  });

  final tNotificationModel = NotificationModel('');

  group('SendNotificationRepositoryImpl', () {
    test('Should return NotificationModel when sendNotifications calls the datasource ', () async {
      //*arrange
      when(() => datasource.sendNotifications(const NotificationParamsEmpty())).thenAnswer((_) async => tNotificationModel);
      //?act
      final response = await repository.sendNotifications(const NotificationParamsEmpty());
      //!assert
      expect(response.isRight(), true);
      expect(response, Right(tNotificationModel));
      verify(() => datasource.sendNotifications(const NotificationParamsEmpty())).called(1);
    });
    test('should return a DataSourceFailure when the sendNotifications call to datasource is unsucessful - DIO', () async {
      //*arrange
      when(() => datasource.sendNotifications(const NotificationParamsEmpty())).thenThrow(DioError(requestOptions: RequestOptions(path: 'path')));
      //?act
      final response = await repository.sendNotifications(const NotificationParamsEmpty());
      //!assert
      expect(response.fold(id, id), isA<DataSourceFailure>());
      verify(() => datasource.sendNotifications(const NotificationParamsEmpty())).called(1);
    });
  });
}
