import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWRaisedButtonScreen extends StatefulWidget {
  static String tag = '/MWRaisedButtonScreen';

  @override
  MWRaisedButtonScreenState createState() => MWRaisedButtonScreenState();
}

class MWRaisedButtonScreenState extends State<MWRaisedButtonScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Raised Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ElevatedButton(
                onPressed: () {
                  toast('Default Raised button');
                },
                style: ElevatedButton.styleFrom(primary: Color(0xFFDFDFDF)),
                child: Text(
                  'Default Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary:  Color(0xFFDFDFDF)),
                onPressed: () {
                  toast('Raised button with icon');
                },
                icon: Icon(
                  Icons.add,
                  color: black,
                ),
                label: Text(
                  'Raised button with icon',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary:  Color(0xFF9C9C9C)),
                onPressed: () {},
                child: Text(
                  'Disable Raised button',
                  style: secondaryTextStyle(size: 16),
                ),
              ),
              Divider(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Color(0xFF9C9C9C)),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Raised button icon',
                    style: secondaryTextStyle(size: 16),
                  )),
              Divider(),
              ElevatedButton(
                child: Text(
                  'Border Raised button',
                  style: primaryTextStyle(color: black),
                ),
                onPressed: () {
                  toast('Border Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  toast('Rounded Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                child: Text(
                  'Rounded Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  toast('Customize Rounded Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                child: Text(
                  'Customize Rounded Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  toast('Customize Text Style of label');
                },
                child: Text(
                  'Customize Text Style of label',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  toast('Color Fill Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: getColorFromHex('#8998FF'),
                ),
                child: Text(
                  "Color Fill Raised button",
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  toast('Rounded color fill Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: getColorFromHex('#f2866c'),
                  textStyle: TextStyle(color: getColorFromHex('#f2866c'),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: getColorFromHex('#f2866c'),
                    ),
                  ),
                ),
                child: Text(
                  'Rounded color fill Raised button',
                  style: primaryTextStyle(color: black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
