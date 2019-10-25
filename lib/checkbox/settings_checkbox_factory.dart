import 'package:flutter_settings/checkbox/layer/checkbox_layer.dart';
import 'package:flutter_settings/checkbox/shapes/square_checkbox_shape.dart';
import 'package:flutter_settings/checkbox/shapes/switch_checkbox_shape.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SettingsCheckBoxFactory {
  static CheckBoxLayerState getType(CheckBoxWidgetType type, bool value,
      WidgetDirection direction, Function onPressed) {
    if (type == CheckBoxWidgetType.Box)
      return SquareCheckBoxLayer(
          checked: value, direction: direction, onPressed: onPressed);
    else if (type == CheckBoxWidgetType.Switch) {
      return SwitchCheckBoxShape(
          checked: value, direction: direction, onPressed: onPressed);
    }
    return null;
  }
}
