import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../../domain/entities/credentials_result.dart';
import '../pages/notification/notification_store.dart';

class OnStateNotification extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? bodyController;

  final CredentialResult credentialResult;

  OnStateNotification({
    Key? key,
    this.titleController,
    this.bodyController,
    required this.credentialResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.background,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30.0),
          CircleAvatar(child: Image.asset('assets/onesignal2.png'), maxRadius: 80, backgroundColor: ThemeColors.transparentColor),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                ClipPath(
                  clipper: RoundedDiagonalPathClipper(),
                  child: Container(
                    height: 400,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 90.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: titleController,
                            style: TextStyle(color: ThemeColors.textOrangeColor),
                            decoration: InputDecoration(
                              hintText: Strings.notificationTitleHintText,
                              hintStyle: TextStyle(color: ThemeColors.textOrangeColor),
                              border: InputBorder.none,
                              icon: Icon(Icons.title, color: ThemeColors.iconColor),
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(color: ThemeColors.background.withOpacity(0.5)),
                          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: bodyController,
                            style: TextStyle(color: ThemeColors.textOrangeColor),
                            decoration: InputDecoration(
                              hintText: Strings.notificationContentHintText,
                              hintStyle: TextStyle(color: ThemeColors.textOrangeColor),
                              border: InputBorder.none,
                              icon: Icon(Icons.content_copy, color: ThemeColors.iconColor),
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(color: ThemeColors.background.withOpacity(0.5)),
                          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 420,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        final String title = titleController!.text;
                        final String body = bodyController!.text;
                        Modular.get<NotificationStore>().sendNotifications(title, body, credentialResult);
                      },
                      child: Text(Strings.buttonSendCredential),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(ThemeColors.background),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..quadraticBezierTo(size.width, 0.0, size.width - 20.0, 0.0)
      ..lineTo(40.0, 70.0)
      ..quadraticBezierTo(10.0, 85.0, 0.0, 120.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
