import 'package:flutter/material.dart';
import 'package:web001/app/counter_app.dart';
import 'package:web001/widget/device_drop_down_list.dart';
import 'package:web001/widget/sized_box_device.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _deviceType = 'iPhone 6/7/8';

  // TODO: able to switch _childApp ?
  Widget _childApp = CounterApp(title: 'Flutter Demo Home Page');

  void _updateDeviceType(String newValue) {
    // change state _MyHomePageState
    setState(() {
      _deviceType = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          DeviceDropDownList(
            initValue: _deviceType,
            onChanged: _updateDeviceType,
          ),
          SizedBoxDevice(deviceType: _deviceType, child: _childApp),
        ],
      ),
    );
  }
}
