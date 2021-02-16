import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'widgets/w-main-page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return 
    Platform.isIOS ?
    CupertinoApp(
      home: Platform.isIOS ? CupertinoPageScaffold(child: MainPage()) : Scaffold(
      body: MainPage(),
    ))  
    :   MaterialApp(
        home: Platform.isIOS ? CupertinoPageScaffold(child: MainPage()) : Scaffold(
      body: MainPage(),
    ))   ;
  }
}
