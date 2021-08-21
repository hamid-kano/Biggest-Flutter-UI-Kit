import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/CustomCalender.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14CalendarScreen1 extends StatefulWidget {
  @override
  _T14CalendarScreen1State createState() => _T14CalendarScreen1State();
}

class _T14CalendarScreen1State extends State<T14CalendarScreen1> {
  @override
  void initState() {
    super.initState();
    init();
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
        backgroundColor: white,
        body: Stack(
          children: [
            Row(
              children: [
                Text(t14_txt_Create_New_task, textAlign: TextAlign.center, style: boldTextStyle(size: 18, color: t14_colorBlue)).expand(),
                IconButton(
                  icon: Icon(Icons.check, color: t14_colorBlue, size: 20),
                  onPressed: () {
                    finish(context);
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.all(16),
              height: context.height(),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(20)),
                backgroundColor: t14_SuccessBgColor,
              ),
              child: TextField(
                minLines: 1,
                maxLines: 4,
                autofocus: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: t14_hint_txt_type,
                  hintStyle: TextStyle(color: t14_colorSkyBlue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 210),
              height: context.height(),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(22)),
                backgroundColor: t14_txt_BlueColor,
              ),
              child: CustomCalender(),
            ),
          ],
        ),
      ),
    );
  }
}
