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
              increment();
            },
            child: Icon(
              Icons.add_circle_outline,
              size: 50,
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
              width: 60,
              height: 60,
              child: Center(
                  child: Text(
                '$activeCounter',
                style: TextStyle(fontSize: 32,color: Colors.white),
              )),
              decoration: BoxDecoration(
                  //  border: Border.all(color: Colors.red,width: 1),
                  color: Theme.of(context).accentColor,
                  shape: BoxShape.circle)),
           FlatButton(
              onPressed: () {
                decrement();
              },
              child: Icon(
                Icons.remove_circle_outline,
                size: 50,
                color: Theme.of(context).accentColor,
              )),
        ],
      ),
    );
  }
}
