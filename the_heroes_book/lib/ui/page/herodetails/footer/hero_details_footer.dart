import 'package:flutter/material.dart';
import 'package:the_heroes_book/model/hero.dart';
import 'package:the_heroes_book/ui/page/herodetails/footer/friends_showcase.dart';
import 'package:the_heroes_book/ui/page/herodetails/footer/skills_showcase.dart';
import 'package:the_heroes_book/ui/page/herodetails/footer/universes_showcase.dart';

class HeroShowcase extends StatefulWidget {
  HeroShowcase(this.hero);

  final TheHero hero;

  @override
  _HeroShowcaseState createState() => _HeroShowcaseState();
}

class _HeroShowcaseState extends State<HeroShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: 'Skills'),
      Tab(text: 'Universes'),
      Tab(text: 'Friends'),
    ];
    _pages = [
      SkillsShowcase(),
      UniversesShowcase(),
      FriendsShowcase(),
    ];
    _controller = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
