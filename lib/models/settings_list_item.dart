
import 'package:flutter/material.dart';

class SettingsSelectionItem<T> {
  final T value;
  final String text;

  const SettingsSelectionItem(
    this.value,
    this.text,
    {Key key,}
  );
} 