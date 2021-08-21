import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class T9WalkThrough extends StatefulWidget {
  static String tag = '/T9WalkThrough';

  @override
  T9WalkThroughState createState() => T9WalkThroughState();
}

class T9WalkThroughState extends State<T9WalkThrough> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 30;
    return Scaffold();
  }
}
