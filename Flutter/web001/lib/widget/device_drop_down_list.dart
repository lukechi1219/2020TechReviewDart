import 'package:flutter/material.dart';

class DeviceDropDownList extends StatelessWidget {
  final initValue;
  final ValueChanged<String> onChanged;

  const DeviceDropDownList({this.initValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: DropdownButton<String>(
        value: this.initValue,
        items: <String>['iPhone 6/7/8', 'iPhone 6/7/8 Plus', 'iPhone X']
            .map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: this.onChanged,
      ),
    );
  }
}
