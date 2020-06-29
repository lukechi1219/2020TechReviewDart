import 'dart:io';

String fixture(String name) {
  var pathSeparator = Platform.pathSeparator;
  var dir = Directory.current.path;
  if (dir.endsWith('${pathSeparator}test')) {
    dir = dir.replaceAll('${pathSeparator}test', '');
  }
  return File('$dir${pathSeparator}test${pathSeparator}fixtures${pathSeparator}$name')
      .readAsStringSync();
}
