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
        margin: EdgeInsets.all(10),
        child: Card(
            color: Theme.of(context).cardColor ,
            child: Center(
              child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      toggleExpansion(index);
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pray.title , style:Theme.of(context).textTheme.bodyText1 ),
                          Icon(Icons.arrow_drop_down,color: Theme.of(context).accentColor,)
                        ],
                      ),
                    )),
                Divider(color: Colors.black,),
                Column(
                  children: pray.prays.map((pr) {
                    return Column(
                      children: [
                        Text(pr,style: Theme.of(context).textTheme.bodyText1),
                        Divider(color: Colors.grey,)                  
                      ],
                    
                    );
                  }).toList(),
                ),
              ],
          )),
            ),
        ),
      );
    } else {
      return  GestureDetector(
         onTap: () {
                  toggleExpansion(index);
                },
          child: Container(
          margin: EdgeInsets.all(10),
          child: Card(
              color: Theme.of(context).cardColor,
              child: Container(
              padding: EdgeInsets.all(16),
                  child: Center(
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      Text(pray.title,style: Theme.of(context).textTheme.bodyText1),
                      Icon(Icons.arrow_left,color: Theme.of(context).accentColor,)
                    ],
                  ),),
            ),
          ),
        ),
      );
    }
  }
}
