import 'package:flutter/material.dart';
import './w-coutner.dart';
import './w-controller.dart';

class Counting extends StatefulWidget {
  @override
  _CountingState createState() => _CountingState();
}

class _CountingState extends State<Counting> {
  int tawafCoutner = 0;
  int sa3iCoutner = 0;
  int activeCounter = 0;
  bool isTawafActive = true;

  increaseActivePhase() {
    if (activeCounter == 7) {
      // I should tell the user that the max is 7 here
      return;
    }
    setState(() {
      this.activeCounter++;
    });
  }

  decreaseActivePhase() {
    if (activeCounter == 0) {
      // I should tell the user that the min is 0 here
      return;
    }
    setState(() {
      this.activeCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Counter(
          activeCounter: activeCounter,
          increment: increaseActivePhase,
          decrement: decreaseActivePhase,
        ),
        Controller()
      ],
    ));
  }
}
