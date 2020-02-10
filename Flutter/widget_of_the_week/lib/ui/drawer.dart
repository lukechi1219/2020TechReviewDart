import 'package:flutter/material.dart';

import 'animated_container.dart';
import 'future_builder.dart';
import 'home.dart';
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
            child: Text('Header'),
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
              Navigator.pushNamed(context, AnimatedContainerPage.rout);
            },
          ),
          ListTile(
            title: Text('FutureBuilder'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, FutureBuilderPage.rout);
            },
          ),
          ListTile(
            title: Text('Transition'),
            subtitle: Text('sub'),
            onTap: () {
              Navigator.pushNamed(context, TransitionPage.rout);
            },
          ),
        ],
      ),
    );
  }
}
