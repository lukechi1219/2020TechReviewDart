import 'package:flutter/material.dart';

import 'drawer.dart';

import '../util/ui_util.dart';

class FutureBuilderPage extends StatefulWidget {
  static final rout = '/future_builder';
  final String title;

  FutureBuilderPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FutureBuilderPagePageState();
  }
}

class _FutureBuilderPagePageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    //
    Future<String> _calculation = Future<String>.delayed(
      Duration(seconds: 2),
      () => 'Data Loaded',
    );

    return SizedBoxUtil.build(
        context,
        FutureBuilder<String>(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //
            List<Widget> children = [];

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                children = <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Result: ${snapshot.data}'),
                  )
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                children = <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('not hasData, nor hasError'),
                  )
                ];
              }
            } else {
              var message = 'initing...';

              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.waiting) {
                message = 'Awaiting result...';
              } else {
                // ConnectionState.none
                message = 'no result.';
              }

              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(message),
                )
              ];
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              drawer: RoutesDrawer(),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              ),
            );
          },
        ));
  }
}
