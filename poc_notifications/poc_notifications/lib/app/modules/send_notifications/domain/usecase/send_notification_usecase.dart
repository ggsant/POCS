import 'package:dartz/dartz.dart';
import '../models/notification_params.dart';
import '../repositories/send_notification_repository.dart';
import '../entities/notification_result.dart';
import '../errors/notifications_failures/notifications_failures.dart';

abstract class SendNotificationUseCase {
  Future<Either<NotificationsFailures, NotificationResult>> call(NotificationParams params);
}

class SendNotificationUseCaseImpl implements SendNotificationUseCase {
  final SendNotificationRepository repository;

  const SendNotificationUseCaseImpl(this.repository);

  @override
  Future<Either<NotificationsFailures, NotificationResult>> call(NotificationParams params) async {
    if (params is NotificationParamsEmpty) {
      return Right(const NotificationResult('Nenhum parâmetro foi especificado.'));
    }

    if (params.title.isEmpty) {
      return Left(const ValidationNotificationFailure('O titulo não pode ser vazio.'));
    } else if (params.body.isEmpty) {
      return Left(const ValidationNotificationFailure('O body não pode ser vazio.'));
    } else if (params.appId.isEmpty) {
      return Left(const ValidationNotificationFailure('O appId não pode ser vazio.'));
    }

    return await repository.sendNotifications(params);
  }
}
