import 'package:flutter/material.dart';

import 'generic_classes.dart';

class PrepareWidget {
  static Widget prepareWidget(
    dynamic object, {
    dynamic parameter = const GenericParameter(),
    BuildContext context,
    Function stringToWidgetFunction,
  }) {
    if (object == null) {
      return (null);
    }
    if (object is Widget) {
      return (object);
    }
    if (object is String) {
      if (stringToWidgetFunction == null) {
        return (Text(object));
      } else {
        return (stringToWidgetFunction(object));
      }
    }
    if (object is Function) {
      if (parameter is GenericParameter) {
        if (context == null) {
          return (prepareWidget(object(),
              stringToWidgetFunction: stringToWidgetFunction));
        } else {
          return (prepareWidget(object(context),
              stringToWidgetFunction: stringToWidgetFunction));
        }
      }
      if (context == null) {
        return (prepareWidget(object(parameter),
            stringToWidgetFunction: stringToWidgetFunction));
      }
      return (prepareWidget(object(parameter, context),
          stringToWidgetFunction: stringToWidgetFunction));
    }
    return (Text("Unknown type: ${object.runtimeType.toString()}"));
  }
}
