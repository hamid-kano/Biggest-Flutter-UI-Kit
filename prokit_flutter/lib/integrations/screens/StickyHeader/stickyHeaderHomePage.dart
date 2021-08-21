import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'AnimatedHeaders.dart';
import 'OverLappingHeaders.dart';
import 'SimpleHeaders.dart';

class StickyHeaderHomePage extends StatefulWidget {
  @override
  _StickyHeaderHomePageState createState() => _StickyHeaderHomePageState();
}

class _StickyHeaderHomePageState extends State<StickyHeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Sticky Header'),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: boxDecorations(),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SimpleHeaders()));
                  },
                  title: Text('Headers and Content', textAlign: TextAlign.justify),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: boxDecorations(),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AnimatedHeaders()));
                  },
                  title: Text('Animated Headers with Content', textAlign: TextAlign.justify),
                ),
              ),
              Container(
                decoration: boxDecorations(),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => OverLappingHeaders()),
                    );
                  },
                  title: Text('Headers overlapping the Content', textAlign: TextAlign.justify),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const ShadowColor = Color(0x95E9EBF0);

BoxDecoration boxDecorations({double radius = 8, Color color = Colors.transparent, Color bgColor = Colors.white, var showShadow = true}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: ShadowColor, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}
