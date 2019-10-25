import 'package:flutter/material.dart';
import 'package:flutter_settings/inputField/base/base_input_dialog.dart';
import 'package:flutter_settings/inputField/dialogs/simple_input_dialog.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class InputDialogFactory {
  BaseInputDialog getShape(
      InputDialogType type, String title, String dialogButtonText,TextInputType keyboardType) {
    switch (type) {
      case InputDialogType.Simple:
        return SimpleInputDialog(
          title: title,
          buttonText: dialogButtonText,
          keyboardType: keyboardType,
        );
    }
    return null;
  }
}
