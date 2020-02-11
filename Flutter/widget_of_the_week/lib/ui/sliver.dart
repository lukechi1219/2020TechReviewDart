import 'package:flutter/material.dart';

import '../util/ui_util.dart';
import 'drawer.dart';

class SliverPage extends StatelessWidget {
  static final rout = '/sliver';

  SliverPage({Key key, this.title}) : super(key: key);

  final String title;

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
              SliverAppBar(
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
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.lightGreen,
                        child: Text(
                          'text 1',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.purpleAccent,
                        child: Text(
                          'text 2',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.yellow,
                        child: Text(
                          'text 3',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.blue,
                        child: Text(
                          'text 4',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.brown,
                        child: Text(
                          'text 5',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.cyan,
                        child: Text(
                          'text 6',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150.0,
                        color: Colors.deepOrange,
                        child: Text(
                          'text 7',
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
//              SliverGrid(
//                delegate: SliverChildListDelegate(
//                  [
//                    Row(),
//                  ],
//                ),
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 5,
//                ),
//              ),
            ],
          ),
        ));
  }
}
