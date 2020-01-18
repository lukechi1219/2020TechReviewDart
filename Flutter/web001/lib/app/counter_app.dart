import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  CounterApp({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
//    Size media = MediaQuery.of(context).size;
//    print('$media');

    return LayoutBuilder(
      builder: (context, constrains) {
        //
        var maxWidth = constrains.maxWidth;
        print('$maxWidth');

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          drawer: (maxWidth < 600)
              ? Drawer(
                  child: Container(),
                )
              : null,
          body: Center(
            child: Row(
              children: <Widget>[
                maxWidth > 600 ? Flexible(flex: 1, child: Container()) : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
