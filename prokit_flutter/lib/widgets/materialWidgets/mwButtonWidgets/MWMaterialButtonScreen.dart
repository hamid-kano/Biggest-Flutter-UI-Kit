import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWMaterialButtonScreen extends StatefulWidget {
  static String tag = '/MWMaterialButtonScreen';

  @override
  _MWMaterialButtonScreenState createState() => _MWMaterialButtonScreenState();
}

class _MWMaterialButtonScreenState extends State<MWMaterialButtonScreen> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Material Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              MaterialButton(
                onPressed: () {
                  toast('Default Material button');
                },
                child: Text(
                  'Default Material button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              TextButton.icon(
                  onPressed: () {
                    toast('Material button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Material button with icon',
                    style: primaryTextStyle(),
                  )),
              Divider(),
              MaterialButton(
                onPressed: null,
                child: Text(
                  'Disable Material button',
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
                    'Disable Material button icon',
                    style: secondaryTextStyle(size: 16),
                  )),
              Divider(),
              MaterialButton(
                onPressed: () {
                  toast('Border Material button');
                },
                shape: Border.all(color: appStore.iconColor!),
                child: Text(
                  'Border Material button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  toast('Rounded Material button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    )),
                child: Text(
                  'Rounded Material button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  toast('Customize Rounded Material button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    )),
                child: Text(
                  'Customize Rounded Material button',
                  style: primaryTextStyle(),
                ),
              ),
              Divider(),
              MaterialButton(
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    )),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  toast('Color Fill Material button');
                },
                color: getColorFromHex('#8998FF'),
                child: Text(
                  "Color Fill Material button",
                  style: primaryTextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  toast('Rounded color fill Material button');
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: getColorFromHex('#f2866c'),
                child: Text(
                  'Rounded color fill Material button',
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
                child: MaterialButton(
                  onPressed: () {
                    toast('Gradient Material button');
                  },
                  splashColor: Colors.transparent,
                  child: Text(
                    'Gradient Material button',
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
