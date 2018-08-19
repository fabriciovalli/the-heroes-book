import 'dart:async';
import 'package:the_heroes_book/model/hero.dart';

class HeroesBloc {
  List<TheHero> heroes = <TheHero>[
    TheHero("Spiderman",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    TheHero("Batman",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    TheHero("Homem Formiga",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    TheHero("Ministro da Magia",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    TheHero("Amiguinho",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    TheHero("Ronaldo",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    TheHero("Eronaldo",
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
  ];

  final heroController = StreamController<List<TheHero>>();

  Stream<List<TheHero>> get heroFriends => heroController.stream;

  HeroesBloc() {
    heroController.add(heroes);
  }

  void dispose() {
    heroController.close();
  }
}
