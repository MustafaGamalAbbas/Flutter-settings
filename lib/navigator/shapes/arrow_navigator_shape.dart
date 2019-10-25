import 'package:flutter/material.dart';
import 'package:flutter_settings/navigator/base/base_navigator_shape.dart';

class ArrowNavigatorShape extends BaseNavigatorShape {
  final bool right;

  ArrowNavigatorShape(this.right);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Icon(
        this.right ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
        color: Colors.grey,
        size: 25,
      ),
    );
  }
}
