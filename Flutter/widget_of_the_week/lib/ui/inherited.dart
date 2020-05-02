import 'package:flutter/material.dart';

import '../util/ui_util.dart';
import 'drawer.dart';

class InheritedWidgetPage extends StatelessWidget {
  static final route = '/inherited_widget';

  InheritedWidgetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBoxUtil.build(
      context,
      Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          drawer: RoutesDrawer(),
          body: PageContainer()),
    );
  }
}

class PageContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageContainerState();
}

class PageContainerState extends State<PageContainer> {
  var _colorOne = Colors.red;
  var _colorTwo = Colors.brown;

  void _switchColor() {
    setState(() {
      // change ancestor colors
      var _temp = _colorOne;
      _colorOne = _colorTwo;
      _colorTwo = _temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyAncestor build');

    return Container(
      child: MyAncestor(
          colorOne: _colorOne,
          colorTwo: _colorTwo,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              ColorOneWidget(),
              ColorTwoWidget(),
              MaterialButton(
                elevation: 5.0,
                color: Colors.purpleAccent,
                child: Text('change color'),
                onPressed: _switchColor,
              ),
              Text('Ancestor $_colorOne'),
              Text('Ancestor $_colorTwo'),
            ],
          )),
    );
  }
}

class MyAncestor extends InheritedWidget {
  const MyAncestor({
    @required this.colorOne,
    @required this.colorTwo,
    @required Widget child,
  })  : assert(colorOne != null),
        assert(colorTwo != null),
        assert(child != null),
        super(child: child);

  final Color colorOne;
  final Color colorTwo;

  static MyAncestor of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyAncestor>();

  @override
  bool updateShouldNotify(MyAncestor oldWidget) {
    print('updateShouldNotify');
    return colorOne != oldWidget.colorOne || colorTwo != oldWidget.colorTwo;
    // test: if false, then ColorOneWidget won't re-build on _switchColor()
    // return false;
  }
}

class ColorOneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor = MyAncestor.of(context);
    print('ColorOneWidget build');

    return Container(
      color: ancestor.colorOne,
      height: 50.0,
      width: 50.0,
    );
  }
}

class ColorTwoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor = MyAncestor.of(context);
    print('ColorTwoWidget build');

    return Container(
      color: ancestor.colorTwo,
      height: 50.0,
      width: 50.0,
    );
  }
}

/// ****************************************************************************

class InheritedModelPage extends StatelessWidget {
  static final route = '/inherited_model';

  InheritedModelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBoxUtil.build(
      context,
      Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          drawer: RoutesDrawer(),
          body: Container(
            child: Text('InheritedModelPage'),
          )),
    );
  }
}
