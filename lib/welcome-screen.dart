import 'package:flutter/material.dart';

class MyWelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyWelcomeScreenState();
  }
}

class MyWelcomeScreenState extends State<MyWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return
    // change to cupertino later
     MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('أهلا يا زائر بيت الله',
                    style: TextStyle(
                        color: Color.fromRGBO(236, 106, 92, 100),
                        fontSize: 48)),
                Image(image: AssetImage('images/hajj.png')),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "إختر اللغة",
                      style: TextStyle(fontSize: 30),
                    ),
                    MyLanguageDropDown(),
                  ],
                ),
                Image(image: AssetImage('images/arrow_right.png')),
              ],
            )),
      ),
    );
  }
}

class MyLanguageDropDown extends StatefulWidget {
  MyLanguageDropDown({Key key}) : super(key: key);

  @override
  _MyLanguageDropDownState createState() => _MyLanguageDropDownState();
}

class _MyLanguageDropDownState extends State<MyLanguageDropDown> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.red[400]),
      underline: Container(
        height: 2,
        color: Colors.red[400],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['العربية', 'English', 'ʊrdu']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
