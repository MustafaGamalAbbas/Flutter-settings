import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_settings/button/settings_button_layer.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/BaseWidget.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';

class SettingsButton extends BaseWidget {
  SettingsButton(
      {SettingsIcon icon,
      Function onPressed,
      String title,
      WidgetDirection direction = WidgetDirection.ltr,
      String caption,
      TextStyle titleStyle,
      TextStyle captionStyle,
      Widget overlayerWidget})
      : super(
          settingsWidget: SettingsButtonLayer(
            title: title,
            caption: caption,
            direction: direction,
            titleStyle: titleStyle,
            captionStyle: captionStyle,
          ),
          icon: icon,
          onPressed: onPressed,
          direction: direction,
          overlayerWidget: overlayerWidget,
        );
}
