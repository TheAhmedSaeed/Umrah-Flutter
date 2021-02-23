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
        this._sa3iCoutner = this._activeCounter;
        this._activeCounter = this._tawafCoutner;
        this._isTawafActive = true;
      } else if (phase == "sa3i") {
        this._tawafCoutner = this._activeCounter;
        this._activeCounter = this._sa3iCoutner;
        this._isTawafActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final curScaleFactor = mediaQuery.textScaleFactor;


    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("عداد ",style: Theme.of(context).textTheme.bodyText1 ),
                    Text(this._isTawafActive ? "الطواف" : "السعي",style: Theme.of(context).textTheme.headline2 ),
                  ],
                ),
              ),
              Counter(
                activeCounter: _activeCounter,
                increment: increaseActivePhase,
                decrement: decreaseActivePhase,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Controller(
            isTawafActive: _isTawafActive,
            changeActivePhase: changeActivePhase,
          ),
        )
      ],
    );
  }
}
