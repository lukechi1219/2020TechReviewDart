import 'package:flutter/material.dart';

import 'drawer.dart';

class AnimatedContainerPage extends StatelessWidget {
  static final rout = '/animated_container';

  AnimatedContainerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      drawer: RoutesDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('temp'),
          ],
        ),
      ),
    );
  }
}
