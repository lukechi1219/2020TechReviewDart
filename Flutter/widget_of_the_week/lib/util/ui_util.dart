import 'package:flutter/material.dart';

class SizedBoxUtil {
  static Widget build(BuildContext context, Widget widget) {

    var media = MediaQuery.of(context).size;
//    print('Size ${media.width} * ${media.height}');

    bool needReSize = false;
    if (media.width > 414.0 || media.height > 823.0) {
      needReSize = true;
    }
//    print('needReSize: $needReSize');

    if (needReSize) {
      return Container(
        color: Colors.black87,
        child: Center(
          child: SizedBox(
            width: 414.0,
            height: 736.0,
            child: widget,
          ),
        ),
      );
    }
    return widget;
  }
}
