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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
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
