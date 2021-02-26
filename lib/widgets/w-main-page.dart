import 'package:Umrah/widgets/w-praying.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './w-counting.dart';
import 'dart:io';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            backgroundColor: Color.fromRGBO(56, 47, 56, 1),
            middle: Text(
              ' عمرة + ',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          )
        : AppBar(
            backgroundColor: Color.fromRGBO(56, 47, 56, 1),
            title: Text(
              ' عمرة + ',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ));

    final actualScreenSize = (mediaQuery.size.height -
        (mediaQuery.padding.top +
            appBar.preferredSize.height +
            mediaQuery.padding.bottom));

    final counterPtg = mediaQuery.size.height < 800 ? 0.27 : 0.23;
    
    final curScaleFactor = mediaQuery.textScaleFactor;
    return LayoutBuilder(builder: (ctx, contsraints) {
      return MaterialApp(
          theme: ThemeData(
              primaryColor: Color.fromRGBO(56, 47, 56, 1),
              accentColor: Color.fromRGBO(42, 47, 53, 1),
              cardColor: Color.fromRGBO(228, 179, 138, 1),
              errorColor: Colors.red,
              textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    fontSize: 18 * curScaleFactor,
                    color: Color.fromRGBO(42, 47, 53, 1),
                  ),
                  bodyText2: TextStyle(
                    fontSize: 14 * curScaleFactor,
                    color: Color.fromRGBO(42, 47, 53, 1),
                  ),
                  headline1: TextStyle(
                      fontSize: 24 * curScaleFactor,
                      color: Color.fromRGBO(42, 47, 53, 1),
                      fontWeight: FontWeight.bold),
                  headline2: TextStyle(
                      color: Color.fromRGBO(56, 47, 56, 1),
                      fontSize: 18 * curScaleFactor,
                      fontWeight: FontWeight.bold))),
          builder: (context, child) {
            return Directionality(
                textDirection: TextDirection.rtl, child: child);
          },
          home: Scaffold(
            appBar: appBar,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: actualScreenSize * (1 - counterPtg),
                      child: Praying()),
                  Container(
                      height: actualScreenSize * counterPtg, child: Counting()),
                ],
              ),
            ),
          ));
    });
  }
}
