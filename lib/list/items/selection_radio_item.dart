import 'package:flutter/material.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SelectionRadioItem extends StatelessWidget {
  final String title;
  final bool check;
  final Function onSelect;
  final WidgetDirection direction;

  const SelectionRadioItem(
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
        padding: const EdgeInsets.all(16.0),
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
            Align(
                alignment: this.direction == WidgetDirection.ltr
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: check
                    ? Icon(
                        Icons.radio_button_checked,
                        size: 18,
                        color: Colors.green[700],
                      )
                    : Icon(
                        Icons.radio_button_unchecked,
                        size: 18,
                        color: Colors.green[700],
                      )),
          ],
        ),
      ),
      onPressed: onSelect,
    );
  }
}
