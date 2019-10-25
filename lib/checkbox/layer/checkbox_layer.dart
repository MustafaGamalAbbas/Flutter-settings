import 'package:flutter/material.dart';
import 'package:flutter_settings/checkbox/settings_checkbox_factory.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class CheckBoxLayer extends StatefulWidget {
  bool value;
  Function onPressed;
  CheckBoxWidgetType type;
  WidgetDirection direction;
  CheckBoxLayer(
      {this.type,
      this.direction = WidgetDirection.ltr,
      @required this.onPressed,
      this.value,
      Key key})
      : super(key: key);

  @override
  CheckBoxLayerState createState() {
    return SettingsCheckBoxFactory.getType(
        this.type, this.value, this.direction, this.onPressed);
  }
}

abstract class CheckBoxLayerState extends State<CheckBoxLayer> {
  bool checked;
  WidgetDirection direction;
  Function onPressed;

  CheckBoxLayerState(
      {@required this.checked,
      @required this.direction,
      @required this.onPressed});

  Widget getWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: MinimumHeightSettingsWidget),
        child: RawMaterialButton(
          onPressed: changeState,
          child: Align(
            alignment: widget.direction == WidgetDirection.ltr
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: getWidget(),
          ),
        ));
  }

  void changeState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        this.checked = !this.checked;
        onPressed(this.checked);
      });
    });
  }
}
