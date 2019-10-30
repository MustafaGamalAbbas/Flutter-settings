import 'package:flutter/material.dart';
import 'package:flutter_settings/list/selection_dialogs/SimpleSelectionDialog.dart';
import 'package:flutter_settings/models/settings_list_item.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/SettingsButton.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';

class SettingsSelectionList<T> extends SettingsButton {
  final List<SettingsSelectionItem<T>> items;
  SimpleSelectionDialog dialog;
  int chosenItemIndex;

  SettingsSelectionList({
    this.chosenItemIndex = 0,
    @required BuildContext context,
    @required this.items,
    @required String title,
    String dialogTitle,
    String dismissTitle,
    String caption,
    SettingsIcon icon,
    @required Function onSelect,
    WidgetDirection direction = WidgetDirection.ltr,
  }) : super(
          icon: icon,
          title: title,
          caption: caption,
          direction: direction,
          onPressed: null
        ) {
    dialog = SimpleSelectionDialog(
      direction: direction,
      dialogTitle: dialogTitle ?? title,
      items: items,
      onSelect: onSelect,
      chosenItemIndex: chosenItemIndex,
      dismissText: dismissTitle ?? "Cancel",
    );
    this.onPressed = () {
      showDialog<SettingsSelectionItem>(
          context: context, builder: (BuildContext context) => dialog);
    };
  }
}
