import 'package:flutter/material.dart';

import 'animated_container.dart';
import 'future_builder.dart';
import 'grid_view.dart';
import 'home.dart';
import 'inherited.dart';
import 'inherited2.dart';
import 'inherited3.dart';
import 'page_view.dart';
import 'sliver.dart';
import 'table.dart';
import 'transition.dart';

class RoutesDrawer extends StatelessWidget {
  const RoutesDrawer({
    Key key,
  }) : super(key: key);

  static List<List<String>> widgetList = [
    ['DrawerHeader', ''],
    ['Welcome', WelcomePage.route],
    ['Home', HomePage.route],
    ['AnimatedContainer', AnimatedPage.route],
    ['FutureBuilder', FuturePage.route],
    ['Transition', TransitionPage.route],
    ['Table', TablePage.route],
    ['Sliver', SliverPage.route],
    ['Grid', GridPage.route],
    ['InheritedWidgetPage', InheritedWidgetPage.route],
    ['InheritedModelPage', InheritedModelPage.route],
    ['InheritedModelPage2', InheritedModelPage2.route],
    ['InheritedModelPage3', InheritedModelPage3.route],
//    [
//      '',
//    ],
//    [
//      '',
//    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var strArr = widgetList[index];

          if (index == 0) {
            return DrawerHeader(
              child: Container(
                color: Colors.lightGreen,
                child: Text(
                  'Header',
                ),
              ),
            );
          }

          return ListTile(
            title: Text(strArr[0]),
            subtitle: Text('sub'),
            onTap: () {
              // change route
              Navigator.pushNamed(context, strArr[1]);
            },
          );
        },
        itemCount: widgetList.length,
      ),
    );
  }
}
