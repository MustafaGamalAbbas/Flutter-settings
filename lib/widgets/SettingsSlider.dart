import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings/slider/slider_layer.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/BaseWidget.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';

class SettingsSlider extends BaseWidget {
  SettingsSlider({
    SettingsIcon icon,
    @required Function onChange,
    Function onChangeEnd,
    Function onChangeStart,
    @required double value,
    Color activeColor,
    WidgetDirection direction = WidgetDirection.ltr,
  }) : super(
          settingsWidget: SliderLayer(
            onChange: onChange,
            value: value,
            onChangeEnd: onChangeEnd,
            onChangeStart: onChangeStart,
            activeColor: activeColor,
          ),
          icon: icon,
          onPressed: null,
          direction: direction,
          overlayerWidget: Container(
            width: 0.0,
            height: 0.0,
          ),
        );
}
