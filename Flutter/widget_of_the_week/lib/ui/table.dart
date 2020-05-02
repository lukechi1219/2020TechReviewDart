import 'package:flutter/material.dart';

import '../util/ui_util.dart';
import 'drawer.dart';

class TablePage extends StatelessWidget {
  static final route = '/table';

  TablePage({Key key, this.title}) : super(key: key);

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
          body: Table(
//            defaultVerticalAlignment: TableCellVerticalAlignment.top,
//            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//            defaultVerticalAlignment: TableCellVerticalAlignment.baseline, // ?
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
//            defaultVerticalAlignment: TableCellVerticalAlignment.fill, // ?
//          defaultColumnWidth: FlexColumnWidth(1.0),
//          defaultColumnWidth: FractionColumnWidth(.25),
            defaultColumnWidth: FixedColumnWidth(100.0),
//            defaultColumnWidth: IntrinsicColumnWidth(),
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 150.0,
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 50.0,
                    child: Container(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 100.0,
                    child: Container(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 50.0,
                    child: Container(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 30.0,
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 50.0,
                    child: Container(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
