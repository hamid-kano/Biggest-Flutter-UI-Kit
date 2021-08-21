import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class CWSegmentedControlScreen extends StatefulWidget {
  static String tag = '/CWSegmentedControlScreen';

  @override
  CWSegmentedControlScreenState createState() => CWSegmentedControlScreenState();
}

class CWSegmentedControlScreenState extends State<CWSegmentedControlScreen> {
  int selectedValue = 0;

  final Map<int, Widget> sWidget = <int, Widget>{0: Text("Home", style: primaryTextStyle()), 1: Text("Search", style: primaryTextStyle()), 2: Text("Profile", style: primaryTextStyle())};

  static Widget giveCenter(String yourText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.height,
        Text("$yourText", style: boldTextStyle()).paddingOnly(left: 16, right: 16),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Text(
            lipsum.createParagraph(numSentences: 2),
            style: secondaryTextStyle(),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  List<Widget> view = [giveCenter("Home Page"), giveCenter("Search Page"), giveCenter("Profile Page")];

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
    final Map<int, Widget> sWidget = <int, Widget>{
      0: Text("Home", style: primaryTextStyle(color: selectedValue == 0 ? white : appStore.textPrimaryColor)),
      1: Text("Search", style: primaryTextStyle(color: selectedValue == 1 ? white : appStore.textPrimaryColor)),
      2: Text("Profile", style: primaryTextStyle(color: selectedValue == 2 ? white : appStore.textPrimaryColor))
    };

    return Scaffold(
      appBar: appBar(context, 'Cupertino segment control'),
      body: SafeArea(
          child: Column(
        children: [
          16.height,
          Container(
            color: appStore.appBarColor,
            width: context.width(),
            child: CupertinoSegmentedControl(
              borderColor: appColorPrimary,
              selectedColor: appColorPrimary,
              groupValue: selectedValue,
              onValueChanged: (dynamic val) {
                setState(() {
                  selectedValue = val;
                });
              },
              children: sWidget,
            ),
          ),
          8.height,
          view[selectedValue]
        ],
      )),
    );
  }
}
