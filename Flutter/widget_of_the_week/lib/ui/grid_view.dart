import 'package:flutter/material.dart';

import '../util/ui_util.dart';
import 'drawer.dart';

class GridPage extends StatelessWidget {
  static final route = '/grid';

  GridPage({Key key, this.title}) : super(key: key);

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
            child: Text(
              'TBD...',
            ),
          ),
        ));
  }
}
