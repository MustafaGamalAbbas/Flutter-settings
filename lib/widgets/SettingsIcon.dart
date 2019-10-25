import 'package:flutter/material.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SettingsIcon extends StatelessWidget {
  final IconData icon;
  final Color color, backgroundColor;
  final String text;
  const SettingsIcon(
      {Key key,
      @required this.icon,
      this.color,
      this.text,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ?? Colors.transparent),
          child: Icon(
            this.icon,
            color: this.color ?? Colors.white,
            size: SettingsIconSize,
          ),
        ),
        text != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.black),
                ),
              )
            : Container(
                width: 0.0,
                height: 0.00,
              )
      ],
    );
  }
}
