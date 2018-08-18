import 'package:flutter/material.dart';
import 'package:the_heroes_book/utils/uidata.dart';

class LabelBelowIcon extends StatelessWidget {
  final label;
  final IconData icon;
  final iconColor;
  final onPressed;
  final circleColor;
  final isCircleEnabled;
  final betweenHeight;

  LabelBelowIcon(
      {this.label,
      this.icon,
      this.onPressed,
      this.iconColor = Colors.white,
      this.circleColor,
      this.isCircleEnabled = true,
      this.betweenHeight = 5.0});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isCircleEnabled
              ? CircleAvatar(
                  backgroundColor: circleColor,
                  radius: 30.0,
                  child: Icon(
                    icon,
                    size: 24.0,
                    color: iconColor,
                  ),
                )
              : Icon(
                  icon,
                  size: 36.0,
                  color: iconColor,
                ),
          SizedBox(
            height: betweenHeight,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: UIData.ralewayFont),
          )
        ],
      ),
    );
  }
}
