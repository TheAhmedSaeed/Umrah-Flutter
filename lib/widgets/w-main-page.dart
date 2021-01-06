import 'package:Umrah/widgets/w-praying.dart';
import 'package:flutter/material.dart';
import './w-counting.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(243, 233, 219, 1),
          title: Text(
            'أدعية العمرة',
            style: TextStyle(color: Colors.black, fontSize: 28),
          )),
      body: Column(
        children: [
        Praying(),
        Counting(),
        ],
      ),
    ));
  }
}
