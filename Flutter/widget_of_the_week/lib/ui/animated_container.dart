import 'package:flutter/material.dart';

import 'drawer.dart';

import '../util/ui_util.dart';

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
    milliseconds: 1500,
  );

  var _myHeight = 75.0;

  var _opacity = 0.0;

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
          _myHeight += 200.0;
        } else {
          _myHeight -= 200.0;
        }
        if (_opacity == 0.0) {
          _opacity = 1.0;
        } else {
          _opacity = 0.0;
        }
      });
    };

    return SizedBoxUtil.build(
        context,
        Scaffold(
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
                      height: _myHeight,
                      duration: _myDuration,
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
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/cat.jpg',
                          width: 250.0,
                          height: 250.0,
                        ),
                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: _myDuration,
                          child: Image.asset(
                            'images/cat2.jpg',
                            width: 250.0,
                            height: 250.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: _onPressedFab,
                ),
              ],
            ),
          ),
        ));
  }
}
