import 'dart:async';

import 'package:flutter/material.dart';
import './w-coutner.dart';
import './w-controller.dart';

class Counting extends StatefulWidget {
  @override
  _CountingState createState() => _CountingState();
}

// times to show alerts to users
const int maxCounterTimeInMS = 3000;
const maxCounterDuration = Duration(milliseconds: maxCounterTimeInMS);
const int smallAlertTimeInMS = 1500;
const smallAlertDuration = const Duration(milliseconds: smallAlertTimeInMS);

const int tawafIsNotDoneMsgTimeInMS = 3000;
const tawafIsNotDoneMsgDuration = const Duration(milliseconds: tawafIsNotDoneMsgTimeInMS);


class _CountingState extends State<Counting> {
  int _tawafCoutner = 0;
  int _sa3iCoutner = 0;

  bool showMaxSa3iMsg = true;
  bool showMaxTawafMsg = true;

  //coutner variables
  int _activeCounter = 0;

  // controller variables
  bool _isTawafActive = true;

  increaseActivePhase(BuildContext context) {
    if (_activeCounter == 7) {
      if (_isTawafActive) {
        if (showMaxTawafMsg) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'العدد الأقصى لمرات الطواف هو 7 .. إنقز على "سعي" لتبدأ عداد السعي',
            ),
            duration: maxCounterDuration,
          ));
          showMaxTawafMsg = false;
          new Timer(maxCounterDuration, () => {showMaxTawafMsg = true});
        }
      } else {
        if (showMaxSa3iMsg) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'العدد الأقصى لمرات السعي هو 7 انتهيت من العمرة والحمدلله',
            ),
            duration: maxCounterDuration,
          ));
          showMaxSa3iMsg = false;
          new Timer(maxCounterDuration, () => {showMaxSa3iMsg = true});
        }
      }

      return;
    }
    if (_activeCounter == 6) {
      if (_isTawafActive) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            'انتهيت من الطواف .. بدأ السعي الآن',
          ),
          duration: smallAlertDuration,
        ));
        setState(() {
          this._activeCounter++;
          this.changeActivePhase("sa3i");
        });
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            'انتهيت من العمرة .. تقبل الله',
          ),
          duration: smallAlertDuration,
        ));
        setState(() {
          this._activeCounter++;
        });
      }

      return;
    }

    setState(() {
      this._activeCounter++;
    });
  }

  decreaseActivePhase(BuildContext context) {
    if (_activeCounter == 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'لا يمكن جعل العداد ينقص عن 0',
        ),
        duration: const Duration(milliseconds: 1500),
      ));
      return;
    }
    showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget confirmButton = FlatButton(
      child: Text("تأكيد "),
      onPressed: () {
        setState(() {
          this._activeCounter--;
        });
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget cancelButton = FlatButton(
      child: Text(
        "إلغاء",
        style: TextStyle(),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "تأكيد",
        textDirection: TextDirection.rtl,
      ),
      content: Text(
        "هل أنت متأكد من إنقاص العداد ؟ ",
        textDirection: TextDirection.rtl,
      ),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  changeActivePhase(String phase,[BuildContext context]) {
    if (phase == "tawaf") {
      setState(() {
        this._sa3iCoutner = this._activeCounter;
        this._activeCounter = this._tawafCoutner;
        this._isTawafActive = true;
      });
    } else if (phase == "sa3i") {
      if (_activeCounter >= 7) {
        setState(() {
          this._tawafCoutner = this._activeCounter;
          this._activeCounter = this._sa3iCoutner;
          this._isTawafActive = false;
        });
      } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'لا يمكنك بدء السعي حتى الإنتهاء من  ٧ أشواط في الطواف ',
            ),
            duration: maxCounterDuration,
          ));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Theme.of(context).primaryColor, width: 3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("عداد ",
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(this._isTawafActive ? "الطواف" : "السعي",
                          style: Theme.of(context).textTheme.headline2),
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
      ),
    );
  }
}
