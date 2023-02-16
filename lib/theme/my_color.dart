import 'package:flutter/material.dart';

enum MyAppBar {
  appBar(appColor: Colors.pinkAccent);

  const MyAppBar({required this.appColor});
  final Color appColor;
}
