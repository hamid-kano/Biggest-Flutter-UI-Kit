import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';

class T14ProfileScreen2 extends StatefulWidget {
  @override
  _T14ProfileScreen2State createState() => _T14ProfileScreen2State();
}

class _T14ProfileScreen2State extends State<T14ProfileScreen2> {
  List<String> profileList = ['Biography', 'Interesting', 'Worked at', 'Graduate at', 'Log out ', 'Settings'];

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: t14_profileT2BgColor),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hello there,Ann!', style: boldTextStyle(color: t14_colorBlue)),
                      ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)), child: Image.asset(t14_profile1, width: 50, height: 50)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: t14_colorWhite),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('43', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                            4.height,
                            Text('Posts', style: secondaryTextStyle(size: 12)),
                          ],
                        ),
                        Container(height: 30, width: 1, color: t14_AppDividerColor),
                        Column(
                          children: [
                            Text('162', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                            4.height,
                            Text('Followers', style: secondaryTextStyle(size: 12)),
                          ],
                        ),
                        Container(height: 30, width: 1, color: t14_AppDividerColor),
                        Column(
                          children: [
                            Text('26', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                            4.height,
                            Text('Likes', style: secondaryTextStyle(size: 12)),
                          ],
                        ),
                      ],
                    ).paddingAll(16),
                  ),
                ],
              ),
            ),
            ListView.separated(
                itemCount: profileList.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(profileList[index], style: primaryTextStyle(color: t14_colorBlue, size: 14)),
                        Icon(Icons.keyboard_arrow_right, size: 20, color: t14_colorBlue),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
