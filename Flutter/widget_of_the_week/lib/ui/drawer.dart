import 'package:flutter/material.dart';

import 'animated_container.dart';
import 'future_builder.dart';
import 'grid_view.dart';
import 'home.dart';
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
    ['Welcome', WelcomePage.rout],
    ['Home', HomePage.rout],
    ['AnimatedContainer', AnimatedPage.rout],
    ['FutureBuilder', FuturePage.rout],
    ['Transition', TransitionPage.rout],
    ['Table', TablePage.rout],
    ['Sliver', SliverPage.rout],
    ['Grid', GridPage.rout],
//    [
//      '',
//    ],
//    [
//      '',
//    ],
//    [
//      '',
//    ],
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
              Navigator.pushNamed(context, strArr[1]);
            },
          );
        },
        itemCount: widgetList.length,
      ),
    );
  }
}
