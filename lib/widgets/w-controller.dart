import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.yellow,
              child: Center(
                child: Text('سعي'),
              )),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.orange,
              child: Center(
                child: Text('طواف'),
              )),
        ),
      ],
    );
  }
}
