import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static var rout = '/';

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Header'),
            ),
            ListTile(
              title: Text('1. Test'),
              subtitle: Text('sub'),
              onTap: () {
//                      Navigator.of(context).push(route);
              },
            ),
            ListTile(
              title: Text('2. Test'),
              subtitle: Text('sub'),
              onTap: () {
//                      Navigator.of(context).push(route);
              },
            ),
            ListTile(
              title: Text('3. Test'),
              subtitle: Text('sub'),
              onTap: () {
//                      Navigator.of(context).push(route);
              },
            ),
          ],
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
