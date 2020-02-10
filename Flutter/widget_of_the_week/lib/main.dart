import 'package:flutter/material.dart';

import 'ui/animated_container.dart';
import 'ui/future_builder.dart';
import 'ui/home.dart';
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
        HomePage.rout: (context) => HomePage(title: 'Flutter Demo Home'),
        AnimatedContainerPage.rout: (context) => AnimatedContainerPage(title: 'Animated'),
        FutureBuilderPage.rout: (context) => FutureBuilderPage(title: 'Animated'),
        TransitionPage.rout: (context) => TransitionPage(title: 'Animated'),
      },
    );
  }
}
