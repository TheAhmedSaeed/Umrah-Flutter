import '../classes/c-pray.dart';
import 'package:flutter/material.dart';

class PrayerGroup extends StatelessWidget {
  int index;
  Pray pray;
  Function toggleExpansion;

  PrayerGroup({this.pray, this.index, this.toggleExpansion});

  @override
  Widget build(BuildContext context) {
    if (pray.isExpanded) {
      return Container(
          child: Column(
        children: [
          GestureDetector(
              onTap: () {
                toggleExpansion(index);
              },
              child: Text(pray.title)),
          Column(
            children: pray.prays.map((pr) {
              return Text(pr);
            }).toList(),
          ),
        ],
      ));
    } else {
      return Container(
        child: GestureDetector(
            onTap: () {
              toggleExpansion(index);
            },
            child: Text(pray.title)),
      );
    }
  }
}
