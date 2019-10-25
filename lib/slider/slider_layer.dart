import 'package:flutter/material.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SliderLayer extends StatefulWidget {
  final double value;
  final Color activeColor;
  final Function onChange, onChangeEnd, onChangeStart;
  final WidgetDirection direction;
  
  SliderLayer(
      {this.direction = WidgetDirection.ltr,
      this.value,
      Key key,
      this.activeColor,
      this.onChange,
      this.onChangeEnd,
      this.onChangeStart})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SliderLayerState(
      direction: WidgetDirection.ltr,
      value: this.value,
      onChange: this.onChange,
      onChangeEnd: this.onChangeEnd,
      onChangeStart: this.onChangeStart,
      activeColor: this.activeColor,
    );
  }
}

class _SliderLayerState extends State<SliderLayer> {
  WidgetDirection direction;
  double value;
  final Color activeColor;
  final Function onChange, onChangeEnd, onChangeStart;

  _SliderLayerState({
    this.direction,
    this.onChange,
    this.onChangeEnd,
    this.onChangeStart,
    this.value,
    this.activeColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Slider(
        onChanged: (double value) {
          setState(() {
            this.value = value;
          });
          onChange(value);
        },
        onChangeEnd: this.onChangeEnd,
        onChangeStart: this.onChangeStart,
        value: this.value,
        activeColor: this.activeColor ?? Colors.green,
        inactiveColor: Colors.grey,
      ),
    ));
  }
}
