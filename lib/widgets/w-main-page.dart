import 'package:Umrah/widgets/w-praying.dart';
import 'package:flutter/material.dart';
import './w-counting.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        backgroundColor: Color.fromRGBO(243, 233, 219, 1),
        title: Text(
          ' الأدعية ',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ));

    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return LayoutBuilder(builder: (ctx, contsraints) {
      return MaterialApp(
          theme: ThemeData(
              primaryColor: Color.fromRGBO(243, 233, 219, 1),
              accentColor: Color.fromRGBO(236, 106, 92, 1),
              cardColor: Color.fromRGBO(249, 221, 215, .8),
              errorColor: Colors.red,
              textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                      fontSize: 18 * curScaleFactor,
                      color: Color.fromRGBO(209, 68, 51, 1)))),
          builder: (context, child) {
            return Directionality(
                textDirection: TextDirection.rtl, child: child);
          },
          home: Scaffold(
            appBar: appBar,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: (MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).padding.top +
                                appBar.preferredSize.height)) *
                        0.8,
                    child: Praying()),
                Container(
                    height: (MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).padding.top +
                                appBar.preferredSize.height)) *
                        0.2,
                    child: Counting()),
              ],
            ),
          ));
    });
  }
}
