import 'package:flutter/material.dart';
import 'package:the_heroes_book/logic/bloc/heroes_bloc.dart';
import 'package:the_heroes_book/model/hero.dart';
import 'package:the_heroes_book/ui/page/heroeslist/hero_card.dart';

class HeroesListPage extends StatefulWidget {
  @override
  _HeroesListPageState createState() => new _HeroesListPageState();
}

class _HeroesListPageState extends State<HeroesListPage> {
  //allposts dropdown
  Widget bottomBar() => PreferredSize(
      preferredSize: Size(double.infinity, 50.0),
      child: Container(
          color: Colors.black,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "All Heroes",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )));

  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        elevation: 2.0,
        title: Text("Heroes Book"),
        forceElevated: true,
        pinned: true,
        floating: true,
        bottom: bottomBar(),
      );

  Widget bodyList(List<TheHero> heroes) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return HeroCard(hero: heroes[index]);
          },
          childCount: heroes.length,
        ),
      );

  Widget bodySliverList() {
    HeroesBloc heroesBloc = HeroesBloc();
    return StreamBuilder<List<TheHero>>(
        stream: heroesBloc.heroFriends,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: <Widget>[
                    appBar(),
                    bodyList(snapshot.data),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodySliverList(),
    );
  }
}
