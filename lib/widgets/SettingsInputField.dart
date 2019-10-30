import 'package:flutter/material.dart';
import 'package:flutter_settings/inputField/input_dialog_factory.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/SettingsButton.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';

class SettingsInputField extends SettingsButton {
  SettingsInputField({
    String dialogTitle,
    String dialogButtonText = "Okay",
    SettingsIcon icon,
    @required String title,
    @required Function onPressed,
    @required BuildContext context,
    WidgetDirection direction = WidgetDirection.ltr,
    TextInputType keyboardType = TextInputType.text,
    String caption,
  }) : super(
            icon: icon,
            title: title,
            caption: caption,
            direction: direction,
            onPressed: () async {
              final output = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => InputDialogFactory()
                      .getShape(InputDialogType.Simple, dialogTitle ?? title,
                          dialogButtonText, keyboardType));
              onPressed(output);
            });
}
