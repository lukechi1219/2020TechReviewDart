import 'package:flutter/material.dart';
import 'package:widget_of_the_week/ui/home.dart';

import 'animated_container.dart';

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
            title: Text('3. Test'),
            subtitle: Text('sub'),
            onTap: () {
//              Navigator.pushNamed(context, HomePage.rout);
            },
          ),
        ],
      ),
    );
  }
}
