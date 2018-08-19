import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  final Color color;
  final double height;

  const CommonDivider(
      {Key key, this.color = const Color(0xFFE0E0E0), this.height = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
    );
  }
}
