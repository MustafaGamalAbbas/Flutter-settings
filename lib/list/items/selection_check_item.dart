import 'package:flutter/material.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SelectionCheckItem extends StatelessWidget {
  final String title;
  final bool check;
  final Function onSelect;
  final WidgetDirection direction;
  const SelectionCheckItem(
      {Key key,
      this.title,
      this.check,
      this.onSelect,
      this.direction = WidgetDirection.ltr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: this.direction == WidgetDirection.ltr
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Text(title,
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            check
                ? Align(
                    alignment: this.direction == WidgetDirection.ltr
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.green[700],
                    ))
                : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
          ],
        ),
      ),
      onPressed: onSelect,
    );
  }
}
