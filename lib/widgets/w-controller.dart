import 'package:flutter/material.dart';

class Controller extends StatelessWidget {
  final bool isTawafActive;
  final Function changeActivePhase;

  Controller({this.isTawafActive, this.changeActivePhase});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {  
                if(isTawafActive)         
                changeActivePhase("sa3i");
            },
            child: Container(
              decoration: BoxDecoration(
                color: isTawafActive ? Colors.transparent : Colors.green,
                border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('سعي'),
                )),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if(!isTawafActive)
               changeActivePhase("tawaf");
            },
            child: Container(
                padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isTawafActive ? Colors.green : Colors.transparent,
                border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text('طواف'),
                )),
          ),
        ),
      ],
    );
  }
}
