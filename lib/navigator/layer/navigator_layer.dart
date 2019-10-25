import 'package:flutter/material.dart';
import 'package:flutter_settings/navigator/shapes/arrow_navigator_shape.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class NavigatorLayer extends StatelessWidget {
  final Function onPressed;
  final WidgetDirection direction;

  NavigatorLayer({@required this.direction, this.onPressed, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: MinimumHeightSettingsWidget),
        child: Align(
          alignment: this.direction == WidgetDirection.ltr
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: ArrowNavigatorShape(this.direction == WidgetDirection.ltr),
        ));
  }
}
