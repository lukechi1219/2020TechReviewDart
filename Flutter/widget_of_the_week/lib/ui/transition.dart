import 'package:flutter/material.dart';

import 'drawer.dart';

import '../util/ui_util.dart';

class TransitionPage extends StatefulWidget {
  static final route = '/transition';
  final String title;

  TransitionPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage>
    with SingleTickerProviderStateMixin {
  //
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    //
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    _controller.forward();
    //
    return SizedBoxUtil.build(
        context,
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          drawer: RoutesDrawer(),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'FadeTransition here',
                    style: Theme.of(context).textTheme.display1,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
