import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_settings/checkbox/layer/checkbox_layer.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/SettingsButton.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';

class SettingsCheckBox extends SettingsButton {
  SettingsCheckBox({
    SettingsIcon icon,
    @required Function onPressed,
    @required String title,
    String caption,
    @required bool value,
    WidgetDirection direction = WidgetDirection.ltr,
    CheckBoxWidgetType type = CheckBoxWidgetType.Box,
    TextStyle titleStyle,
    TextStyle captionStyle,
  }) : super(
            icon: icon,
            title: title,
            caption: caption,
            direction: direction,
            overlayerWidget: CheckBoxLayer(
              onPressed: onPressed,
              direction: direction,
              type: type,
              value: value,
            ),
            onPressed: null,
            titleStyle: titleStyle,
            captionStyle: captionStyle);
}
