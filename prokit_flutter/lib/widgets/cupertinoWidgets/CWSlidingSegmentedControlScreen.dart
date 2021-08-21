import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;


class CWSlidingSegmentedControlScreen extends StatefulWidget {
  static String tag = '/CWSlidingSegmentedControlScreen';

  @override
  CWSlidingSegmentedControlScreenState createState() => CWSlidingSegmentedControlScreenState();
}

class CWSlidingSegmentedControlScreenState extends State<CWSlidingSegmentedControlScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = <int, Widget>{0: Text("Item 1"), 1: Text("Item 2")};
  int? _sliding = 0;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget mPage(var value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: boldTextStyle(),
          ).paddingLeft(16),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            child: Text(
              lipsum.createParagraph(numSentences: 2),
              style: secondaryTextStyle(),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Cupertino Sliding SegmentedControl'),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Home',
                          style: primaryTextStyle(color: _sliding == 0 ? blackColor : grey),
                        )),
                    1: Container(padding: EdgeInsets.all(8), child: Text('Booking', style: primaryTextStyle(color: _sliding == 1 ? blackColor : grey))),
                    2: Container(padding: EdgeInsets.all(8), child: Text('Setting', style: primaryTextStyle(color: _sliding == 2 ? blackColor : grey))),
                  },
                  groupValue: _sliding,
                  onValueChanged: (dynamic newValue) {
                    setState(() {
                      _sliding = newValue;
                    });
                  }),
            ),
            if (_sliding == 0) mPage("Home"),
            if (_sliding == 1) mPage("Booking"),
            if (_sliding == 2) mPage("Setting"),
          ],
        ),
      ),
    );
  }
}
