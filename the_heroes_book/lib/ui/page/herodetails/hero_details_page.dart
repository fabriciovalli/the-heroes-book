import 'package:flutter/material.dart';
import 'package:the_heroes_book/model/hero.dart';
import 'package:the_heroes_book/ui/page/herodetails/footer/hero_details_footer.dart';

class HeroDetailsPage extends StatelessWidget {
  final TheHero hero;
  Size deviceSize;

  HeroDetailsPage({Key key, this.hero}) : super(key: key);

  Widget profileHeader() => Container(
        height: deviceSize.height / 4,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      border: Border.all(width: 2.0, color: Colors.white)),
                  child: Hero(
                    tag: hero.name,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(hero.image),
                    ),
                  ),
                ),
                Text(
                  hero.name,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Text(
                  "Awesome Title",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
  Widget detailsCard() => Container(
        height: deviceSize.height / 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Briefing",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hero.name,
                          style: TextStyle(fontSize: 13.0, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget bodyData() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileHeader(),
            detailsCard(),
            HeroShowcase(hero, deviceSize.height / 6),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text("Hero Details"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: bodyData(),
    );
  }
}
