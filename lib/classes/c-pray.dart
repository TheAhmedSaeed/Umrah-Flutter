import 'package:flutter/material.dart';

class Pray {
  @required
  String title;
  @required
  List<String> prays;
  @required
  bool isExpanded;

  Pray({this.title, this.prays,this.isExpanded});
}
