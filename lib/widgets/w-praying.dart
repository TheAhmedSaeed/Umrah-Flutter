import 'package:flutter/material.dart';

import '../pray-class.dart';

class Praying extends StatefulWidget {
  @override
  _PrayingState createState() => _PrayingState();
}

class _PrayingState extends State<Praying> {
  List<Pray> prayers = [
    Pray(title: 'الثناء على الله', prays: [
      '((سبحان الله عددَ ما خلق في السماء، وسبحان الله عددَ ما خلق في الأرض، وسبحان الله عددَ ما بين ذلك، وسبحان الله عددَ ما هو خالق، والله أكبر مثل ذلك، والحمد لله مثل ذلك، ولا حول ولا قوة إلا بالله مثل ذلك))',
      '((سبحان الذي تعطف العزّ وقال به، سبحان الذي لبس المجد وتكرم به، سبحان الذي لا ينبغي التسبيح إلا له، سبحان ذي الفضل والنعم، سبحان ذي المجد والكرم، سبحان ذي الجلال والإكرام)).'
    ]),
    Pray(title: 'الصلاة على النبي ', prays: [
      'اللهم صلي وسلم على سيدنا ونبينا محمد ',
      'هم صل على محمد وعلى آل محمد كما صليت على إبراهيم وعلى آل إبراهيم إنك حميد مجيد، اللهم بارك على محمد وعلى آل محمد كما باركت على إبراهيم وعلى آل إبراهيم إنك حميد مجيد'
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prayers.map((pray) {
        return Container(
            child: Column(
          children: [
            Column(
              children: pray.prays.map((pr) {
                return Text(pr);
              }).toList(),
            ),
          ],
        ));
      }).toList(),
    );
  }
}
