import 'package:flutter/material.dart';

class UniversesShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
        'Universes: TODO',
        style: textTheme.title.copyWith(color: Colors.black),
      ),
    );
  }
}
