import 'package:flutter/material.dart';

import 'ui/animated_container.dart';
import 'ui/future_builder.dart';
import 'ui/grid_view.dart';
import 'ui/home.dart';
import 'ui/inherited.dart';
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
        WelcomePage.rout: (context) => WelcomePage(title: 'PageView'),
        HomePage.rout: (context) => HomePage(title: 'Home'),
        AnimatedPage.rout: (context) => AnimatedPage(title: 'Animated'),
        FuturePage.rout: (context) => FuturePage(title: 'FutureBuilder'),
        TransitionPage.rout: (context) => TransitionPage(title: 'Transition'),
        TablePage.rout: (context) => TablePage(title: 'Table'),
        SliverPage.rout: (context) => SliverPage(title: 'Table'),
        GridPage.rout: (context) => GridPage(title: 'Table'),
        InheritedWidgetPage.rout: (context) => InheritedWidgetPage(title: 'InheritedWidget'),
        InheritedModelPage.rout: (context) => InheritedModelPage(title: 'InheritedModel'),
      },
    );
  }
}
