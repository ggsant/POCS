import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/widgets/on_state.dart';

import 'notification_store.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends ModularState<NotificationPage, NotificationStore> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  Widget _buildError(NotificationsFailures error) {
    if (error is DataSourceFailure) {
      return Center(
        child: Text('Algo inesperado aconteceu. Tente novamene'),
      );
    } else if (error is ValidationFailure) {
      return Center(
        child: Text('Os campos de titulo e corpo da notificação não podem estar vazios'),
      );
    } else {
      return Center(
        child: Text('Deu ruim'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder<NotificationStore, NotificationsFailures, NotificationResult>(
        store: controller,
        onLoading: (_) => Center(child: CircularProgressIndicator()),
        onState: (_, state) {
          return OnStatePage(
            bodyController: _bodyController,
            titleController: _titleController,
          );
        },
        onError: (context, error) {
          return _buildError(error!);
        },
      ),
    );
  }
}
