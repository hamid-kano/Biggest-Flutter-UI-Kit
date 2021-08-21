import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14TravelScreen extends StatefulWidget {
  @override
  _T14TravelScreenState createState() => _T14TravelScreenState();
}

class _T14TravelScreenState extends State<T14TravelScreen> {
  List<SubscriptionModel> topTravelList = getTopTravelList();
  List<SubscriptionModel> recommendList = getRecommendList();

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
      appBar: AppBar(
        backgroundColor: t14_colorWhite,
        leading: Icon(Icons.arrow_back_ios_outlined, size: 20).onTap(() {
          finish(context);
        }),
        elevation: 0.0,
        actions: [IconButton(icon: Icon(Icons.star_border, size: 22), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t14_txt_Explore, style: boldTextStyle(size: 18, color: t14_colorBlue)).paddingOnly(left: 16, right: 16, bottom: 8),
            Text(t14_txt_Explore_SubTitle, style: secondaryTextStyle(size: 14)).paddingOnly(left: 16),
            8.height,
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: topTravelList.length,
                  padding: EdgeInsets.only(right: 8, left: 8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = topTravelList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(data.img!, width: 210, height: 220, fit: BoxFit.cover),
                          ),
                          8.height,
                          Text(data.name!, style: primaryTextStyle(size: 14, color: t14_colorBlue)),
                        ],
                      ),
                    );
                  }),
            ),
            Text(t14_txt_Recommend, style: boldTextStyle(size: 16, color: t14_colorBlue)).paddingOnly(left: 16),
            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: recommendList.length,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = recommendList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(data.img!, width: 150, height: 200, fit: BoxFit.cover),
                          ),
                          8.height,
                          Positioned(
                            top: 8,
                            left: 50,
                            child: Text(data.name!, maxLines: 1, overflow: TextOverflow.ellipsis, style: primaryTextStyle(size: 14)),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Text(t14_txt_plan, style: boldTextStyle(size: 16, color: t14_colorBlue)).paddingOnly(left: 16),
            Container(
              height: 200,
              padding: EdgeInsets.all(0),
              child: ListView.builder(
                  itemCount: recommendList.length,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = recommendList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(data.img!, width: 150, height: 200, fit: BoxFit.cover),
                          ),
                          8.height,
                          Positioned(
                            top: 8,
                            left: 50,
                            child: Text(data.name!, maxLines: 1, overflow: TextOverflow.ellipsis, style: primaryTextStyle(size: 14)),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Text(t14_txt_Travel, style: boldTextStyle(size: 16, color: t14_colorBlue)).paddingOnly(left: 16),
            Container(
              height: 200,
              padding: EdgeInsets.all(0),
              child: ListView.builder(
                  itemCount: recommendList.length,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = recommendList[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(data.img!, width: 150, height: 200, fit: BoxFit.cover),
                          ),
                          8.height,
                          Positioned(
                            top: 8,
                            left: 50,
                            child: Text(data.name!, maxLines: 1, overflow: TextOverflow.ellipsis, style: primaryTextStyle(size: 14)),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
