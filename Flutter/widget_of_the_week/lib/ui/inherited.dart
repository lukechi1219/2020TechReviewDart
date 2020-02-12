import 'package:flutter/material.dart';

import 'drawer.dart';

import '../util/ui_util.dart';

class InheritedWidgetPage extends StatelessWidget {
  static final rout = '/inherited_widget';

  InheritedWidgetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBoxUtil.build(
      context,
      Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          drawer: RoutesDrawer(),
          body: Container()),
    );
  }
}

class InheritedModelPage extends StatelessWidget {
  static final rout = '/inherited_model';

  InheritedModelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBoxUtil.build(
      context,
      Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          drawer: RoutesDrawer(),
          body: Container()),
    );
  }
}
