import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWFlatButtonScreen extends StatefulWidget {
  static String tag = '/MWFlatButtonScreen';

  @override
  MWFlatButtonScreenState createState() => MWFlatButtonScreenState();
}

class MWFlatButtonScreenState extends State<MWFlatButtonScreen> {
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
        appBar: appBar(context, "Flat Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              TextButton(
                onPressed: () {
                  toast('Default Flat button');
                },
                child: Text(
                  'Default Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              TextButton.icon(
                  onPressed: () {
                    toast('Flat button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Flat button with icon',
                    style: primaryTextStyle(),
                  )),
              Divider(),
              TextButton(
                onPressed: null,
                child: Text(
                  'Disable Flat button',
                  style: secondaryTextStyle(size: 16),
                ),
              ),
              Divider(),
              TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Flat button icon',
                    style: secondaryTextStyle(size: 16),
                  )),
              Divider(),
              TextButton(
                onPressed: () {
                  toast('Border Flat button');
                },
                style: TextButton.styleFrom(
                    //shape: Border.all(color: appStore.iconColor!),
                    ),
                child: Text(
                  'Border Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  toast('Rounded Flat button');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                child: Text(
                  'Rounded Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  toast('Customize Rounded Flat button');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                child: Text(
                  'Customize Rounded Flat button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  toast('Customize Text Style of label');
                },
                child: Text(
                  'Customize Text Style of label',
                  style: TextStyle(
                    color: appStore.textPrimaryColor,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  toast('Color Fill Flat button');
                },
                style: TextButton.styleFrom(
                  backgroundColor:getColorFromHex('#8998FF'),
                    primary: getColorFromHex('#8998FF')),
                child: Text(
                  "Color Fill Flat button",
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  toast('Rounded color fill flat button');
                },
                style: TextButton.styleFrom(
                  backgroundColor:getColorFromHex('#f2866c'),
                    primary: getColorFromHex('#f2866c'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Rounded color fill flat button',
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    getColorFromHex('#8998FF'),
                    getColorFromHex('#75D7D3'),
                  ]),
                ),
                child: TextButton(
                  onPressed: () {
                    toast('Gradient Flat button');
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.transparent
                  ),
                  //splashColor: Colors.transparent,
                  child: Text(
                    'Gradient Flat button',
                    style: primaryTextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
