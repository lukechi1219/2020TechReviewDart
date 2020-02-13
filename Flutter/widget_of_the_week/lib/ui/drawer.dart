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

  static List<Type> widgetList = [
    Container,
    WelcomePage,
    HomePage,
    AnimatedPage,
    FuturePage,
    TransitionPage,
    TablePage,
    SliverPage,
    GridPage,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListView.builder(
            itemBuilder: (context, index) {
              var rout = '/';
              var widget = widgetList[index];

              switch (widget) {
                case Container:
                  rout = '/';
                  break;
                case WelcomePage:
                  rout = WelcomePage.rout;
                  break;
                case WelcomePage:
                  rout = WelcomePage.rout;
                  break;
                default:
                  rout = '/';
                  break;
              }

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
                title: Text(widget.toString()),
                subtitle: Text('sub'),
                onTap: () {
                  Navigator.pushNamed(context, rout);
                },
              );
            },
            itemCount: widgetList.length,
          ),
          DrawerHeader(
            child: Container(
              color: Colors.lightGreen,
              child: Text(
                'Header',
              ),
            ),
          ),
          ListTile(
            title: Text('Welcome'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, WelcomePage.rout);
            },
          ),
          ListTile(
            title: Text('Home'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, HomePage.rout);
            },
          ),
          ListTile(
            title: Text('AnimatedContainer'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, AnimatedPage.rout);
            },
          ),
          ListTile(
            title: Text('FutureBuilder'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, FuturePage.rout);
            },
          ),
          ListTile(
            title: Text('Transition'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, TransitionPage.rout);
            },
          ),
          ListTile(
            title: Text('Table'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, TablePage.rout);
            },
          ),
          ListTile(
            title: Text('Sliver'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, SliverPage.rout);
            },
          ),
          ListTile(
            title: Text('Grid'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, GridPage.rout);
            },
          ),
        ],
      ),
    );
  }
}
