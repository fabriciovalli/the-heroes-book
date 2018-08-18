import 'package:flutter/material.dart';
import 'package:the_heroes_book/ui/page/home/home_page.dart';
import 'package:the_heroes_book/utils/uidata.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: UIData.appName,
    theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: UIData.quickFont,
        primarySwatch: Colors.amber),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: HomePage(),
    // initialRoute: UIData.notFoundRoute,

    //routes
    // routes: <String, WidgetBuilder>{
    //   UIData.homeRoute: (BuildContext context) => HomePage(),
    // },
    // onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
    //     builder: (context) => new NotFoundPage(
    //           appTitle: UIData.coming_soon,
    //           icon: FontAwesomeIcons.solidSmile,
    //           title: UIData.coming_soon,
    //           message: "Under Development",
    //           iconColor: Colors.green,
    //         ))
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
