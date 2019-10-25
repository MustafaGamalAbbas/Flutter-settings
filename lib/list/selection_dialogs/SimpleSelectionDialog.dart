import 'package:flutter/material.dart';
import 'package:flutter_settings/list/items/selection_item_factory.dart';
import 'package:flutter_settings/models/settings_list_item.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';

class SimpleSelectionDialog extends StatelessWidget {
  final String dialogTitle;
  final String dismissText;
  final List<SettingsSelectionItem> items;
  final Function onSelect;
  final WidgetDirection direction;
  final SelectionDialog selectionDialog;
  int chosenItemIndex;

  SimpleSelectionDialog(
      {Key key,
      this.items,
      this.onSelect,
      this.chosenItemIndex,
      @required this.dialogTitle,
      this.direction,
      this.dismissText,
      this.selectionDialog = SelectionDialog.SimpleCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              dialogTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24.0),
            Column(
              children: items
                  .map((item) => SelectionItemFactory.createSelectionItem(
                          selectionDialog,
                          direction,
                          item.text,
                          items.indexOf(item) == chosenItemIndex, () {
                        this.chosenItemIndex = items.indexOf(item);
                        onSelect(item, chosenItemIndex);
                        Navigator.of(context).pop();
                      }))
                  .toList(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  dismissText,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
