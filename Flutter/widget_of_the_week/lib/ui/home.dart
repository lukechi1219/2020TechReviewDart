import 'package:flutter/material.dart';

import 'drawer.dart';

class HomePage extends StatelessWidget {
  static final rout = '/home';

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      drawer: RoutesDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // tbd...
        },
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
//      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
//      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(
          height: 50.0,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  height: 75,
                  width: 75,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    height: 75,
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 75,
                  width: 75,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    height: 75,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.grey,
                  height: 75,
                  width: 75,
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 75,
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 75,
                  width: 75,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 75,
                  width: 75,
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    height: 75,
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 75,
                  width: 75,
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    height: 75,
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('AH')),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('ML')),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('HL')),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('JL')),
                  label: Text('Laurens'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
