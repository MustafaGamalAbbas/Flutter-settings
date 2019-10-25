import 'package:flutter/material.dart';
import 'package:flutter_settings/list/items/selection_check_item.dart';
import 'package:flutter_settings/list/items/selection_radio_item.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SelectionItemFactory {
  static Widget createSelectionItem(SelectionDialog item,
      WidgetDirection direction, String title, bool check, Function onSelect) {
    print(item.toString());
    if (item == SelectionDialog.SimpleCheck) {
      return SelectionCheckItem(
        direction: direction,
        title: title,
        check: check,
        onSelect: onSelect,
      );
    } else if (item == SelectionDialog.SimpleRadio) {
      return SelectionRadioItem(
        direction: direction,
        title: title,
        check: check,
        onSelect: onSelect,
      );
    }
    return null;
  }
}
