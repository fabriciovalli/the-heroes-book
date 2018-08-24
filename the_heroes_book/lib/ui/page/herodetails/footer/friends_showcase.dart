import 'package:flutter/material.dart';
import 'package:the_heroes_book/logic/bloc/heroes_bloc.dart';
import 'package:the_heroes_book/model/hero.dart';

class FriendsShowcase extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  //showcaseStack
  Widget showcaseStack(BuildContext context, TheHero hero) => InkWell(
        onTap: () => {},
        splashColor: Colors.orange,
        child: Card(
          elevation: 5.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              showcaseImage(hero),
              showcaseColor(),
              showcaseData(hero),
            ],
          ),
        ),
      );

  //stack 1/3
  Widget showcaseImage(TheHero hero) => AspectRatio(
        aspectRatio: 1.0,
        child: Image.network(
          hero.image,
          fit: BoxFit.cover,
        ),
      );

  //stack 2/3
  Widget showcaseColor() => new Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.6),
            blurRadius: 5.0,
          ),
        ]),
      );

  //stack 3/3
  Widget showcaseData(TheHero hero) => Text(
        hero.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
  //bodygrid
  Widget bodyGrid(List<TheHero> friends) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return showcaseStack(context, friends[index]);
        }, childCount: friends.length),
      );

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
        child: Scaffold(key: _scaffoldState, body: bodySliverList()),
      );

  Widget bodySliverList() {
    HeroesBloc heroesBloc = HeroesBloc();
    return StreamBuilder<List<TheHero>>(
        stream: heroesBloc.heroFriends,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: <Widget>[
                    bodyGrid(snapshot.data),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return bodySliverList();
  }
}
