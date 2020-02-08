import 'package:flutter/material.dart';

//void main() => runApp(
//      DevicePreview(
//        builder: (context) => MyApp(),
//      ),
//    );
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      locale: DevicePreview.of(context).locale,
//      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('ML')),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('HL')),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('JL')),
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
