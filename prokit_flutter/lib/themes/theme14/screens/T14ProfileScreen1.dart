import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14ProfileScreen1 extends StatefulWidget {
  @override
  _T14ProfileScreen1State createState() => _T14ProfileScreen1State();
}

class _T14ProfileScreen1State extends State<T14ProfileScreen1> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.width(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [t14_profile1Color1, t14_profileT1exColor2],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: boxDecorationWithShadow(
                          decorationImage: DecorationImage(image: Image.asset(t14_profile1).image, fit: BoxFit.cover),
                          boxShape: BoxShape.circle,
                        ),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Courtney Henry', style: boldTextStyle(color: t14_colorBlue)),
                          Text('User Experience intern', style: secondaryTextStyle()),
                        ],
                      ),
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('1236', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                          4.height,
                          Text('Likes', style: secondaryTextStyle(size: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('1236', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                          4.height,
                          Text('photos', style: secondaryTextStyle(size: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('1236', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                          4.height,
                          Text('Friends', style: secondaryTextStyle(size: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('1236', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                          4.height,
                          Text('Post', style: secondaryTextStyle(size: 12)),
                        ],
                      )
                    ],
                  ),
                ],
              ).paddingAll(24),
            ),
            Text('Biography', style: boldTextStyle(color: t14_colorBlue)).paddingOnly(top: 16, bottom: 8),
            Text(t14_txt_Biography, style: secondaryTextStyle()).paddingOnly(bottom: 16),
            Text('Interesting', style: boldTextStyle(color: t14_colorBlue)).paddingOnly(bottom: 8),
            Text(t14_txt_interesting, style: secondaryTextStyle()).paddingOnly(bottom: 16),
            Text('Work dream', style: boldTextStyle(color: t14_colorBlue)).paddingOnly(bottom: 8),
            Text(t14_txt_workDream, style: secondaryTextStyle()).paddingOnly(bottom: 16),
            Text('Graduated at', style: boldTextStyle(color: t14_colorBlue)).paddingOnly(bottom: 8),
            Text(t14_txt_Graduate, style: secondaryTextStyle()).paddingOnly(bottom: 16),
            Text('Interests', style: boldTextStyle(color: t14_colorBlue)).paddingOnly(bottom: 8),
            Wrap(
              spacing: 16.0,
              runSpacing: 8.0,
              children: [
                t14InterestsWrap(txtInterestsName: 'photography'),
                t14InterestsWrap(txtInterestsName: 'publishing'),
                t14InterestsWrap(txtInterestsName: 'design'),
                t14InterestsWrap(txtInterestsName: 'crafts'),
                t14InterestsWrap(txtInterestsName: 'architecture'),
                t14InterestsWrap(txtInterestsName: 'museums'),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }
}
