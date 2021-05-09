import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/constant/constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, appId, token;
  final void Function() delete;
  final void Function() edit;

  const CustomDialogBox({Key? key, required this.title, required this.appId, required this.token, required this.delete, required this.edit})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.padding)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: Constants.padding,
            top: Constants.avatarRadius + Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding,
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: [
              BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  Text('Titulo:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(widget.title, style: TextStyle(fontSize: 15)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('AppId:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(widget.appId, style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('Token:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(widget.token, style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: widget.edit,
                    child: Text('EDITAR', style: TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton(
                    onPressed: widget.delete,
                    child: Text('EXCLUIR', style: TextStyle(fontSize: 12)),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
              child: Image.asset("assets/onesignal.png"),
            ),
          ),
        ),
      ],
    );
  }
}
