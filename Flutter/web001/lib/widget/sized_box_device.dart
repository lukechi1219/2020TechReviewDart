import 'package:flutter/material.dart';

class SizedBoxDevice extends StatelessWidget {

  final String deviceType;
  final Widget child;

  SizedBoxDevice({this.deviceType, this.child});

  @override
  Widget build(BuildContext context) {
    // default iPhone 6/7/8
    double width = 375;
    double height = 667;

    if (deviceType == 'iPhone 6/7/8') {
      width = 375;
      height = 667;
    } else if (deviceType == 'iPhone 6/7/8 Plus') {
      width = 414;
      height = 736;
    } else if (deviceType == 'iPhone X') {
      width = 375;
      height = 812;
//    } else if (deviceType == 'iPad') {
//      width = 768;
//      height = 1024;
    }

    return Container(
//      color: Colors.black87,
      child: Center(
        child: SizedBox(
            width: width,
            height: height,
            child: this.child),
      ),
    );;
  }

}