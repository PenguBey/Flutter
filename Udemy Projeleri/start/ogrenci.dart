import 'dart:math';

import 'ogrenci2.dart';

void main(List<String> args) {
  var child = List.filled(5, Ogrenci("", Random().nextInt(1000)));
  print(child);
}