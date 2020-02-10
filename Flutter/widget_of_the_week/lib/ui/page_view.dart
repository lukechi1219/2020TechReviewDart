import 'package:flutter/material.dart';

import 'drawer.dart';
import 'home.dart';

class WelcomePage extends StatelessWidget {
  static final rout = '/';

  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    //
    final _controller = PageController(
      initialPage: 0, // index 0
    );

    final pageView = PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
//      scrollDirection: Axis.vertical,
      children: <Widget>[
        WelcomePage1(),
        WelcomePage2(),
        WelcomePage3(),
      ],
    );

    return Scaffold(
//      appBar: AppBar(
//        title: Text(this.title),
//      ),
//      drawer: RoutesDrawer(),
      body: pageView,
    );
  }
}

class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  height: 50.0,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'Welcom Page 1',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: Image.asset(
                    'images/cat.jpg',
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'slide left',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class WelcomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  height: 50.0,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'Welcom Page 2',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: Image.asset(
                    'images/cat2.jpg',
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'slide left',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class WelcomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  height: 50.0,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'Welcom Page 3',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: Image.asset(
                    'images/cat.jpg',
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'slide left',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        MaterialButton(
          elevation: 5.0,
          color: Colors.purpleAccent,
          child: Text('go to Home'),
          onPressed: () {
            Navigator.pushNamed(context, HomePage.rout);
          },
        ),
      ],
    );
  }
}

