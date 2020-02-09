import 'package:flutter/material.dart';

import 'drawer.dart';

class AnimatedContainerPage extends StatefulWidget {
  static final rout = '/animated_container';
  final String title;

  AnimatedContainerPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimatedContainerPageState();
  }
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  var _color = Colors.red;

  final _myDuration = Duration(
    milliseconds: 500,
  );

  var _myHeight = 75.0;

  @override
  Widget build(BuildContext context) {
    var _onPressedFab = () {
      setState(() {
        if (_color == Colors.red) {
          _color = Colors.yellow;
        } else {
          _color = Colors.red;
        }
        if (_myHeight == 75.0) {
          _myHeight += 300.0;
        } else {
          _myHeight -= 300.0;
        }
      });
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: RoutesDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                AnimatedContainer(
                  color: _color,
                  duration: _myDuration,
                  height: _myHeight,
                  width: 200.0,
                  curve: Curves.easeInBack,
//                    curve: Curves.easeInSine,
//                    curve: Curves.easeInCirc,
//                    curve: Curves.easeInExpo,
//                    curve: Curves.easeInQuad,
//                    curve: Curves.easeInQuart,
//                    curve: Curves.easeInQuint,
                  child: Text(
                    'temp',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _onPressedFab,
            ),
          ],
        ),
      ),
    );
  }
}
