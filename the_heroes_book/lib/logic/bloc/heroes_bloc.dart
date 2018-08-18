import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_heroes_book/model/hero.dart';

class HeroesBloc {
  final heroController = StreamController<List<TheHero>>();

  Stream<List<TheHero>> get heroFriends => heroController.stream;

  MenuBloc() {}
}
