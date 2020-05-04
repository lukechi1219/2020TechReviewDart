import 'dart:math' as math;

import 'package:flutter/material.dart';

class Utils {
  ///Method to get a random color
  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(0.1);
}

class InheritedModelPage2 extends StatefulWidget {
  static final route = '/inherited_widget2';

  InheritedModelPage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InheritedModelPage2State createState() => _InheritedModelPage2State();
}

class _InheritedModelPage2State extends State<InheritedModelPage2> {
  Color _colorOne = Utils.getRandomColor();
  Color _colorTwo = Utils.getRandomColor();

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'InheritedModel2 Widget',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 12),
        child: Column(
          children: <Widget>[
            Container(
              child: AncestorWidget(
                  _colorOne,
                  _colorTwo,
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const DependentWidget('one'),
                        const DependentWidget('two'),
                      ],
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: RaisedButton(
                      textColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).backgroundColor,
                      onPressed: () => setState(() {
                        _colorOne = Utils.getRandomColor();
                      }),
                      child: Text('RESET Child 1'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: RaisedButton(
                      textColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).backgroundColor,
                      onPressed: () => setState(() {
                        _colorTwo = Utils.getRandomColor();
                      }),
                      child: Text('RESET Child 2'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///Make a subclass for Parent widget
class AncestorWidget extends InheritedModel<String> {
  const AncestorWidget(this.colorOne, this.colorTwo, Widget child)
      : super(child: child);

  ///Add a field for your data
  final Color colorOne;
  final Color colorTwo;

  /// Typically the `inheritFrom` method is called from a model-specific
  /// static `of` method
  static AncestorWidget of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<AncestorWidget>(context, aspect: aspect);
  }

  ///Runs once for each widget to determine if that widget should be rebuild
  ///Checks the aspect for a dependent widget and returns true if that
  ///widget should be rebuild depending on a certain condition.
  @override
  bool updateShouldNotifyDependent(
      AncestorWidget oldWidget, Set<String> aspects) {
    if (aspects.contains('one') && colorOne != oldWidget.colorOne) {
      print("Only widget one is rebuild");
      return true;
    }
    if (aspects.contains('two') && colorTwo != oldWidget.colorTwo) {
      print("Only widget two is rebuild");
      return true;
    }
    return false;
  }

  /// This decides whether dependent widgets should get rebuild if the
  /// inherited widget is replaced
  /// If [updateShouldNotify] returns true, then the
  /// inherited model's [updateShouldNotifyDependent] method is tested for
  /// each dependent and the set of aspect objects it depends on.
  /// The [updateShouldNotifyDependent] method must compare the set of aspect
  /// dependencies with the changes in the model itself.
  @override
  bool updateShouldNotify(AncestorWidget oldWidget) {
    print("First updateShouldNotify is checked");
    return colorOne != oldWidget.colorOne || colorTwo != oldWidget.colorTwo;
  }
}

///Make a subclass for Dependent widget
class DependentWidget extends StatelessWidget {
  const DependentWidget(this._aspect);

  final String _aspect;

  @override
  Widget build(BuildContext context) {
    print('DependentWidget $_aspect build');

    ///Supplying an aspect to indicate which of the ancestor's field this widget cares about
    ///Widgets create a dependency on an [InheritedModel] with a static method
    Color _color = Colors.black;
    final ancestor = AncestorWidget.of(context, this._aspect);

    if (this._aspect == 'one') {
      _color = ancestor.colorOne;
    } else if (this._aspect == 'two') {
      _color = ancestor.colorTwo;
    }

    return Container(
      color: _color,
      height: 150,
      width: 200,
      child: Center(
        child: Text(
          "Dependent Child $_aspect",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
