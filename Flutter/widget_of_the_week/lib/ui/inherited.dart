import 'package:flutter/material.dart';

import '../util/ui_util.dart';
import 'drawer.dart';

class InheritedWidgetPage extends StatelessWidget {
  static final route = '/inherited_widget';

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
          body: Container(
            child: Text('InheritedWidgetPage'),
          )),
    );
  }
}

class InheritedModelPage extends StatelessWidget {
  static final route = '/inherited_model';

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
          body: Container(
            child: Text('InheritedModelPage'),
          )),
    );
  }
}
