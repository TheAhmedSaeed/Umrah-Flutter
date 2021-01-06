import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int activeCounter;
  final Function increment;
  final Function decrement;
  Counter({this.activeCounter, this.increment, this.decrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              onPressed: () {
                decrement();
              },
              child: Icon(
                Icons.remove_circle_outline,
                size: 50,
              )),
          Container(
              width: 50,
              height: 50,
              child: Center(
                  child: Text(
                '$activeCounter',
                style: TextStyle(fontSize: 36),
              )),
              decoration: BoxDecoration(
                  //  border: Border.all(color: Colors.red,width: 1),
                  color: Colors.red[100],
                  shape: BoxShape.circle)),
          FlatButton(
            onPressed: () {
              increment();
            },
            child: Icon(
              Icons.add_circle_outline,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
