import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWTooltipScreen extends StatefulWidget {
  static String tag = '/MWTooltipScreen';

  @override
  MWTooltipScreenState createState() => MWTooltipScreenState();
}

class MWTooltipScreenState extends State<MWTooltipScreen> {
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
        appBar: appBar(context, 'ToolTip'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "Press the icon",
                style: primaryTextStyle(color: appStore.textPrimaryColor),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Tooltip(
                      message: 'Search',
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 35,
                          color: appStore.iconColor,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Tooltip(
                    child: IconButton(
                      icon: Icon(Icons.info, size: 35.0, color: appStore.iconColor),
                      onPressed: () {},
                    ),
                    message: lipsum.createParagraph(numSentences: 1),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    showDuration: Duration(seconds: 10),
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    textStyle: TextStyle(color: Colors.white),
                    preferBelow: true,
                    verticalOffset: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
