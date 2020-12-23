import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(_myApp());

class _myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<_myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: Scaffold(
  backgroundColor: Color.fromRGBO(243, 233, 219, 1),

  body: 
  Padding(
       padding: const EdgeInsets.all(40),
 
  child: Column(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text('أهلا يا زائر بيت الله'
    ,style: TextStyle(color: Color.fromRGBO(236, 106, 92, 100),fontSize: 48)
    )
    ,
    
    Image(image: AssetImage('images/hajj.png')),
    Text("إختر اللغة",style: TextStyle(fontSize:30 ),),
    MyStatefulWidget(),

      Image(image: AssetImage('images/arrow_right.png')),

  ],)),
  ),
  
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
      items: <String>['العربية', 'English','ʊrdu']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
