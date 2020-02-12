import 'package:flutter/material.dart';

import '../util/ui_util.dart';
import 'drawer.dart';

class SliverPage extends StatelessWidget {
  static final rout = '/sliver';

  SliverPage({Key key, this.title}) : super(key: key);

  final String title;

  static final colorList = [
    Colors.lightGreen,
    Colors.purpleAccent,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
  ];

  final sliverAppBar = SliverAppBar(
    floating: false,
    pinned: true,
    snap: false,
    stretch: false,
    expandedHeight: 200.0,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(
        'images/cat.jpg',
      ),
    ),
    title: Text(
      'Sliver App Bar',
    ),
  );

  /*
   */
  final sliverList = SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100.0,
                color: colorList[index],
                child: Text(
                  'text $index',
                ),
              ),
            ),
          ],
        );
      },
      childCount: colorList.length,
    ),
  );

  /*
   */
  final sliverGrid = SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
    ),
    delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        color: colorList[index],
        child: Text(
          'Text $index',
        ),
      );
    }, childCount: colorList.length),
  );

  /*
   */
  @override
  Widget build(BuildContext context) {
    return SizedBoxUtil.build(
        context,
        Scaffold(
//          appBar: AppBar(
//            title: Text(this.title),
//          ),
          drawer: RoutesDrawer(),
          body: CustomScrollView(
            slivers: <Widget>[
              sliverAppBar,
              sliverList,
              sliverGrid,
            ],
          ),
        ));
  }
}
