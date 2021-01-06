import 'package:flutter/material.dart';
import './w-coutner.dart';
import './w-controller.dart';

class Counting extends StatefulWidget {
  @override
  _CountingState createState() => _CountingState();
}

class _CountingState extends State<Counting> {
  int _tawafCoutner = 0;
  int _sa3iCoutner = 0;

  //coutner variables
  int _activeCounter = 0;

  // controller variables
  bool _isTawafActive = true;

  increaseActivePhase() {
    if (_activeCounter == 7) {
      // I should tell the user that the max is 7 here
      return;
    }
    setState(() {
      this._activeCounter++;
    });
  }

  decreaseActivePhase() {
    if (_activeCounter == 0) {
      // I should tell the user that the min is 0 here
      return;
    }
    setState(() {
      this._activeCounter--;
    });
  }

  changeActivePhase(String phase) {
    setState(() {
      if (phase == "tawaf") {
        this._isTawafActive = true;
      } else if (phase == "sa3i") {
        this._isTawafActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Counter(
          activeCounter: _activeCounter,
          increment: increaseActivePhase,
          decrement: decreaseActivePhase,
        ),
        Controller(
          isTawafActive: _isTawafActive,
          changeActivePhase: changeActivePhase,
        )
      ],
    ));
  }
}
