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
          body: WidgetContainer()),
    );
  }
}

class WidgetContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetContainerState();
}

class WidgetContainerState extends State<WidgetContainer> {
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
              const ColorOneWidget(),
              const ColorTwoWidget(),
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
    Key key,
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
  const ColorOneWidget({Key key}) : super(key: key);

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
  const ColorTwoWidget({Key key}) : super(key: key);

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
            child: ModelContainer(),
          )),
    );
  }
}

class ModelContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ModelContainerState();
}

class ModelContainerState extends State<ModelContainer> {
  var _colorOne = Colors.red;
  var _colorTwo = Colors.brown;

  void _changeColorOne() {
    setState(() {
      // change ancestor colors
      if (_colorOne == Colors.red) {
        _colorOne = Colors.green;
      } else {
        _colorOne = Colors.red;
      }
    });
  }

  void _changeColorTwo() {
    setState(() {
      // change ancestor colors
      if (_colorTwo == Colors.brown) {
        _colorTwo = Colors.blue;
      } else {
        _colorTwo = Colors.brown;
      }
    });
  }

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
    print('MyAncestorModel build');

    return Container(
      child: MyAncestorModel(
          colorOne: _colorOne,
          colorTwo: _colorTwo,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),

              /// must be const, otherwise always update no matter InheritedModel aspect
              const ColorOneModelWidget(),

              /// must be const, otherwise always update no matter InheritedModel aspect
              const ColorTwoModelWidget(),

              MaterialButton(
                elevation: 5.0,
                color: Colors.purpleAccent,
                child: Text('change color 1'),
                onPressed: _changeColorOne,
              ),
              MaterialButton(
                elevation: 5.0,
                color: Colors.purpleAccent,
                child: Text('change color 2'),
                onPressed: _changeColorTwo,
              ),
              MaterialButton(
                elevation: 5.0,
                color: Colors.purpleAccent,
                child: Text('switch color'),
                onPressed: _switchColor,
              ),
              Text('Ancestor $_colorOne'),
              Text('Ancestor $_colorTwo'),
            ],
          )),
    );
  }
}

class MyAncestorModel extends InheritedModel<String> {
  const MyAncestorModel({
    Key key,
    @required this.colorOne,
    @required this.colorTwo,
    @required Widget child,
  })  : assert(colorOne != null),
        assert(colorTwo != null),
        assert(child != null),
        super(key: key, child: child);

  final Color colorOne;
  final Color colorTwo;

  static MyAncestorModel of(BuildContext context, String aspect) =>
      InheritedModel.inheritFrom<MyAncestorModel>(
        context,
        aspect: aspect,
      );

  @override
  bool updateShouldNotify(MyAncestorModel oldModel) {
    print('updateShouldNotify');
    return colorOne != oldModel.colorOne || colorTwo != oldModel.colorTwo;
  }

  @override
  bool updateShouldNotifyDependent(
      MyAncestorModel oldModel, Set<String> dependencies) {
    print('updateShouldNotifyDependent');
    return (dependencies.contains('one') && colorOne != oldModel.colorOne) ||
        (dependencies.contains('two') && colorTwo != oldModel.colorTwo);
  }
}

class ColorOneModelWidget extends StatelessWidget {
  const ColorOneModelWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ancestorModel = MyAncestorModel.of(context, 'one');

    print('ColorOneModelWidget build');

    return Container(
      color: ancestorModel.colorOne,
      height: 50.0,
      width: 50.0,
    );
  }
}

class ColorTwoModelWidget extends StatelessWidget {
  const ColorTwoModelWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ancestorModel = MyAncestorModel.of(context, 'two');

    print('ColorTwoModelWidget build');

    return Container(
      color: ancestorModel.colorTwo,
      height: 50.0,
      width: 50.0,
    );
  }
}
