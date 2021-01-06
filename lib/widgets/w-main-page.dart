import 'package:flutter/material.dart';
import 'package:Umrah/pray-class.dart';
import './w-counting.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
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
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(243, 233, 219, 1),
          title: Text(
            'أدعية العمرة',
            style: TextStyle(color: Colors.black, fontSize: 28),
          )),
      body: Column(
        children: [
          Column(
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
          ),
        Counting(),
        ],
      ),
    ));
  }
}
