import 'package:flutter/material.dart';
import 'package:flutter_settings/checkbox/layer/checkbox_layer.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SquareCheckBoxLayer extends CheckBoxLayerState {
  SquareCheckBoxLayer(
      {bool checked, WidgetDirection direction, Function onPressed})
      : super(checked: checked, direction: direction, onPressed: onPressed);

  @override
  Widget getWidget() {
    return Container(
      child: Checkbox(
        value: this.checked,
        onChanged: (bool value) {
          changeState();
        },
        activeColor: Colors.green,
        checkColor: Colors.white,
      ),
    );
  }
}
