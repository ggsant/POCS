import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import '../../../domain/entities/notification_result.dart';
import '../../../domain/errors/notifications_failures/notifications_failures.dart';
import '../../widgets/on_state.dart';

import 'notification_store.dart';

class NotificationPage extends StatefulWidget {
  final CredentialResult credentialResult;

  NotificationPage({Key? key, required this.credentialResult}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends ModularState<NotificationPage, NotificationStore> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final overlayEntry = OverlayEntry(builder: (BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black12,
      child: CircularProgressIndicator(),
    );
  });

  @override
  void initState() {
    super.initState();
    controller.initOneSignal();

    controller.observer(
      onState: (state) {
        final snackbar = SnackBar(
          content: Text('Menssagem enviada com sucesso!'),
          backgroundColor: Colors.green,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      onError: (error) {
        final snackbar = SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      onLoading: (isLoading) {
        if (isLoading) {
          Overlay.of(context)?.insert(overlayEntry);
        } else {
          overlayEntry.remove();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder<NotificationStore, NotificationsFailures, NotificationResult>(
        store: controller,
        onState: (_, state) {
          return OnStatePage(
            titleController: _titleController,
            bodyController: _bodyController,
            credentialResult: widget.credentialResult,
          );
        },
      ),
    );
  }
}
