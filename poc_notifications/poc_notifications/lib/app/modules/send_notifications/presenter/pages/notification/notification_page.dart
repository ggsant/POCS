import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../domain/entities/credentials_result.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
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
      color: ThemeColors.overlayColor,
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
          content: Text(Strings.successMessageText),
          backgroundColor: ThemeColors.succesSnackbar,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      onError: (error) {
        final snackbar = SnackBar(
          content: Text(error.message),
          backgroundColor: ThemeColors.errorSnackbar,
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
          return OnStateNotification(
            titleController: _titleController,
            bodyController: _bodyController,
            credentialResult: widget.credentialResult,
          );
        },
      ),
    );
  }
}
