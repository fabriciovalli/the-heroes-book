import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_heroes_book/model/hero.dart';
import 'package:the_heroes_book/ui/page/herodetails/hero_details_page.dart';

class HeroCard extends StatelessWidget {
  final TheHero hero;

  const HeroCard({Key key, this.hero}) : super(key: key);

  Widget heroStats(IconData icon, String value) => Expanded(
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(value),
          ],
        ),
      );

  Widget heroSummary() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              hero.name,
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              hero.name,
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 12.0),
              width: 80.0,
              height: 2.0,
              color: Colors.indigo,
            ),
            Row(
              children: <Widget>[
                heroStats(FontAwesomeIcons.heartbeat, "8.2"),
                heroStats(Icons.flash_on, "6.0"),
              ],
            ),
            Row(
              children: <Widget>[
                heroStats(Icons.directions_run, "9.5"),
                heroStats(FontAwesomeIcons.heartbeat, "8.2"),
              ],
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return HeroDetailsPage(
              hero: hero,
            );
          }),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Hero(
                  tag: hero.name,
                  child: CircleAvatar(
                    radius: 36.0,
                    backgroundImage: NetworkImage(hero.image),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: heroSummary(),
            ),
          ],
        ),
      ),
    );
  }
}
