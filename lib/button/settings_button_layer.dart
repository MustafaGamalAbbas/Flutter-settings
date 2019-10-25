import 'package:flutter/material.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SettingsButtonLayer extends StatelessWidget {
  final String title;
  final String caption;
  final TextStyle titleStyle, captionStyle;
  final WidgetDirection direction;

  SettingsButtonLayer(
      {this.direction,
      this.title,
      this.caption,
      this.titleStyle,
      this.captionStyle});
  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints(
        minHeight: MinimumHeightSettingsWidget,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              this.title,
              style: titleStyle ??
                  Theme.of(context).textTheme.subtitle.copyWith(fontSize: 16),
              textAlign: textAlign(direction),
            ),
          ),
          Container(
            width: double.infinity,
            child: this.caption != null
                ? Text(this.caption,
                    style: captionStyle ?? Theme.of(context).textTheme.caption,
                    textAlign: textAlign(this.direction))
                : new Container(
                    width: 0.0,
                    height: 0.0,
                  ),
          ),
        ],
      ),
    );
  }

  TextAlign textAlign(direction) {
    if (direction == WidgetDirection.ltr) return TextAlign.left;

    return TextAlign.right;
  }
}
