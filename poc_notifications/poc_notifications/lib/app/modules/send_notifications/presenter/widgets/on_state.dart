import 'package:flutter/material.dart';
import '../../domain/entities/notification_result.dart';

class OnStatePage extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? bodyController;

  OnStatePage({Key? key, this.titleController, this.bodyController})
      : super(key: key);

  final Color color = Color.fromRGBO(229, 75, 77, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30.0),
          CircleAvatar(
            child: Image.asset('assets/onesignal2.png'),
            maxRadius: 80,
            backgroundColor: Colors.transparent,
          ),
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
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              hintText: "Titulo da notificação:",
                              hintStyle: TextStyle(color: color),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.title,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: color.withOpacity(0.5),
                          ),
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 10.0),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: bodyController,
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              hintText: "Conteudo da notificação",
                              hintStyle: TextStyle(color: color),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.content_copy,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: color.withOpacity(0.5),
                          ),
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 10.0),
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

                        final NotificationResult newNotification =
                            NotificationResult('title: $title | body: $body');
                        print(newNotification.message);
                      },
                      child: Text("Enviar notificação",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20)),
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
