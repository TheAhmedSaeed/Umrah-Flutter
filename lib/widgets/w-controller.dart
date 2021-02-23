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
              if(!isTawafActive)
               changeActivePhase("tawaf");
            },
            child: Container(
                padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isTawafActive ? Theme.of(context).primaryColor : Colors.transparent,
                border: Border.all(color:Theme.of(context).primaryColor)),
                child: Center(
                  child: Text('طواف',style: TextStyle(color:  isTawafActive ? Colors.white : Colors.black),),
                )),
          ),
        ),
            Expanded(
          child: GestureDetector(
            onTap: () {  
                if(isTawafActive)         
                changeActivePhase("sa3i");
            },
            child: Container(
              decoration: BoxDecoration(
                color: isTawafActive ? Colors.transparent : Theme.of(context).primaryColor,
                border: Border.all(color: Theme.of(context).primaryColor)),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('سعي',style:  TextStyle(color:  !isTawafActive ? Colors.white : Colors.black),),
                )),
          ),
        ),
      ],
    );
  }
}
