import 'package:flutter/material.dart';
import 'package:flutter_settings/widgets/BaseWidget.dart';
import 'package:flutter_settings/widgets/Separator.dart';

class SettingsSection extends StatelessWidget {
  final Text title;
  final Color titleBackgroundColor;
  final List<BaseWidget> settingsChildren;

  const SettingsSection(
      {Key key,
      @required this.title,
      this.settingsChildren = const <BaseWidget>[],
      this.titleBackgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: titleBackgroundColor ?? Colors.transparent,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Container(width: double.infinity, child: title),
        ),
        Separator(),
        Column(
          children: settingsChildren,
        )
      ],
    );
  }
}
