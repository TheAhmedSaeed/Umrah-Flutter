import 'package:Umrah/welcome-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
