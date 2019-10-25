import 'package:flutter/material.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/Separator.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';

abstract class BaseWidget extends StatelessWidget {
  SettingsIcon icon;
  Widget settingsWidget, overlayerWidget;
  Function onPressed;
  WidgetDirection direction;

  BaseWidget(
      {Key key,
      @required this.settingsWidget,
      @required this.icon,
      @required this.onPressed,
      @required this.direction,
      @required this.overlayerWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MinimumHeightSettingsWidget),
      child: new RawMaterialButton(
        onPressed: () {
          if (this.onPressed != null) {
            this.onPressed();
          }
        },
        child: new Stack(
          children: <Widget>[
            Separator(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: this.direction == WidgetDirection.rtl
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                children: <Widget>[
                  icon ??
                      Container(
                        width: 0.0,
                        height: 0.0,
                      ),
                  Expanded(
                    child: settingsWidget ??
                        new Container(
                          width: 0.0,
                          height: 0.0,
                        ),
                  )
                ],
              ),
            ),
            overlayerWidget ??
                new Container(
                  width: 0.0,
                  height: 0.0,
                )
          ],
        ),
      ),
    );
  }
}
