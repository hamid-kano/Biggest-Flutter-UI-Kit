import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';

class T14ProfileScreen4 extends StatefulWidget {
  @override
  _T14ProfileScreen4State createState() => _T14ProfileScreen4State();
}

class _T14ProfileScreen4State extends State<T14ProfileScreen4> {
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
            Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: boxDecorationWithShadow(
                    decorationImage: DecorationImage(image: Image.asset(t14_profile1).image, fit: BoxFit.cover),
                    boxShape: BoxShape.circle,
                  ),
                ),
                16.height,
                Text('Courtney Henry', style: boldTextStyle(color: t14_colorBlue)),
                4.height,
                Text('3898 Ranchview, california', style: secondaryTextStyle()).paddingOnly(bottom: 16),
                Divider().paddingSymmetric(horizontal: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('1236', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                        4.height,
                        Text('Trades', style: secondaryTextStyle(size: 14)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('256', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                        4.height,
                        Text('Avg.Rating', style: secondaryTextStyle(size: 14)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('13', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                        4.height,
                        Text('Reps Time', style: secondaryTextStyle(size: 14)),
                      ],
                    ),
                  ],
                ).paddingOnly(left: 16, right: 16, top: 16),
              ],
            ),
            ListView.separated(
                itemCount: profileList.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                padding: EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    color: t14_profileT2BgColor1,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          profileList[index],
                          style: primaryTextStyle(color: t14_colorBlue, size: 14),
                        ),
                        Icon(Icons.keyboard_arrow_right, size: 20, color: t14_colorBlue)
                      ],
                    ),
                  );
                }).paddingOnly(left: 8, right: 8, top: 8),
          ],
        ),
      ),
    );
  }
}
