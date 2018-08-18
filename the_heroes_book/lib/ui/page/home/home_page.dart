import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_heroes_book/ui/widgets/label_below_icon.dart';
import 'package:the_heroes_book/ui/widgets/login_background.dart';
import 'package:the_heroes_book/ui/widgets/profile_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  Size deviceSize;
  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      defaultTargetPlatform == TargetPlatform.android
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                  ),
                  ProfileTile(
                    title: "Hi, Fabricio Valli",
                    subtitle: "Welcome to the Heroes Book",
                    textColor: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Find your hero"),
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  Widget actionMenuCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        LabelBelowIcon(
                          icon: FontAwesomeIcons.book,
                          label: "Book",
                          circleColor: Colors.brown,
                        ),
                        LabelBelowIcon(
                          icon: FontAwesomeIcons.globe,
                          label: "Multiverses",
                          circleColor: Colors.indigo,
                        ),
                        LabelBelowIcon(
                          icon: FontAwesomeIcons.userFriends,
                          label: "Friends",
                          circleColor: Colors.amber,
                        ),
                        LabelBelowIcon(
                          icon: FontAwesomeIcons.play,
                          label: "Play",
                          circleColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget allCards(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            searchCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            actionMenuCard(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          LoginBackground(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }
}
