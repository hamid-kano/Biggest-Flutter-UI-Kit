import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';

class T14ProfileScreen3 extends StatefulWidget {
  @override
  _T14ProfileScreen3State createState() => _T14ProfileScreen3State();
}

class _T14ProfileScreen3State extends State<T14ProfileScreen3> {
  List<SubscriptionModel> topTravelList = getTopTravelList();

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
                ).expand(),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 8, bottom: 4, top: 4),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: t14_profileT2BgColor),
                  child: Row(
                    children: [
                      Text('Followed', style: boldTextStyle(size: 14, color: t14_colorSkyBlue)),
                      4.width,
                      Icon(Icons.check, color: t14_colorSkyBlue, size: 20),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('1236', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                    4.height,
                    Text('Likes', style: secondaryTextStyle(size: 14)),
                  ],
                ),
                Column(
                  children: [
                    Text('256', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                    4.height,
                    Text('Followers', style: secondaryTextStyle(size: 14)),
                  ],
                ),
                Column(
                  children: [
                    Text('13', style: boldTextStyle(size: 14, color: t14_colorBlue)),
                    4.height,
                    Text('Following', style: secondaryTextStyle(size: 14)),
                  ],
                ),
              ],
            ).paddingAll(16),
            StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemCount: topTravelList.length,
              shrinkWrap: true,
              staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: Image.asset(topTravelList[index].img!, fit: BoxFit.cover),
              ),
            ),
          ],
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }
}
