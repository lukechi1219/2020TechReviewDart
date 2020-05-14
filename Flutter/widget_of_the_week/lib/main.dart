import 'package:flutter/material.dart';

import 'ui/animated_container.dart';
import 'ui/future_builder.dart';
import 'ui/grid_view.dart';
import 'ui/home.dart';
import 'ui/inherited.dart';
import 'ui/inherited2.dart';
import 'ui/inherited3.dart';
import 'ui/page_view.dart';
import 'ui/sliver.dart';
import 'ui/table.dart';
import 'ui/transition.dart';

//void main() => runApp(
//      DevicePreview(
//        builder: (context) => MyApp(),
//      ),
//    );
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      locale: DevicePreview.of(context).locale,
//      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: HomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        WelcomePage.route: (context) => WelcomePage(title: 'PageView'),
        HomePage.route: (context) => HomePage(title: 'Home'),
        AnimatedPage.route: (context) => AnimatedPage(title: 'Animated'),
        FuturePage.route: (context) => FuturePage(title: 'FutureBuilder'),
        TransitionPage.route: (context) => TransitionPage(title: 'Transition'),
        TablePage.route: (context) => TablePage(title: 'Table'),
        SliverPage.route: (context) => SliverPage(title: 'Table'),
        GridPage.route: (context) => GridPage(title: 'Table'),
        NoInheritedWidgetPage.route: (context) => NoInheritedWidgetPage(title: 'InheritedWidget'),
        InheritedWidgetPage.route: (context) => InheritedWidgetPage(title: 'InheritedWidget'),
        InheritedModelPage.route: (context) => InheritedModelPage(title: 'InheritedModel 1'),
        InheritedModelPage2.route: (context) => InheritedModelPage2(title: 'InheritedModel 2'),
        InheritedModelPage3.route: (context) => InheritedModelPage3(title: 'InheritedModel 3'),
      },
    );
  }
}
