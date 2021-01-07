import 'package:Umrah/widgets/w-prayer-group.dart';
import 'package:flutter/material.dart';

import '../classes/c-pray.dart';

class Praying extends StatefulWidget {
  @override
  _PrayingState createState() => _PrayingState();
}

class _PrayingState extends State<Praying> {
  List<Pray> prayers = [
    Pray(
      title: 'الثناء على الله',
      prays: [
        '((سبحان الله عددَ ما خلق في السماء، وسبحان الله عددَ ما خلق في الأرض، وسبحان الله عددَ ما بين ذلك، وسبحان الله عددَ ما هو خالق، والله أكبر مثل ذلك، والحمد لله مثل ذلك، ولا حول ولا قوة إلا بالله مثل ذلك))',
        '((سبحان الذي تعطف العزّ وقال به، سبحان الذي لبس المجد وتكرم به، سبحان الذي لا ينبغي التسبيح إلا له، سبحان ذي الفضل والنعم، سبحان ذي المجد والكرم، سبحان ذي الجلال والإكرام)).'
      ],
      isExpanded: false,
    ),
    Pray(
      title: 'الصلاة على النبي ',
      prays: [
        'اللهم صلي وسلم على سيدنا ونبينا محمد ',
        ' صل على محمد وعلى آل محمد كما صليت على إبراهيم وعلى آل إبراهيم إنك حميد مجيد، اللهم بارك على محمد وعلى آل محمد كما باركت على إبراهيم وعلى آل إبراهيم إنك حميد مجيد'
      ],
      isExpanded: false,
    )
  ];

  toggleExpansion(int index) {
    if (index < 0 || index > prayers.length) return;
    setState(() {
      this.prayers[index].isExpanded = !this.prayers[index].isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prayers.map((pray) {
        var index = prayers.indexOf(pray);
        return PrayerGroup(
          pray: pray,
          index: index,
          toggleExpansion: toggleExpansion,
        );
      }).toList(),
    );
  }
}
