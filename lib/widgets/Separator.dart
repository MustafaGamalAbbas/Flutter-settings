import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Color color;
  final double height;
  const Separator({Key key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: height ?? 0.3,
        color: color ?? Colors.grey,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
      ),
    );
  }
}
