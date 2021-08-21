import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14TravelScreen2 extends StatefulWidget {
  @override
  _T14TravelScreen2State createState() => _T14TravelScreen2State();
}

class _T14TravelScreen2State extends State<T14TravelScreen2> {
  List<SubscriptionModel> travelStoryList = getTravelStoryList();
  List<SubscriptionModel> travelStoryDetail = getTravelStoryDetailList();

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
        actions: [IconButton(icon: Icon(Icons.search, size: 22), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending', style: boldTextStyle()).paddingOnly(left: 16, right: 16, bottom: 8),
            Container(
              height: 70,
              child: ListView.builder(
                  itemCount: travelStoryList.length,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    SubscriptionModel data = travelStoryList[index];
                    return Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(right: 8, left: 8),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey, width: 2)),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: boxDecorationWithShadow(
                          decorationImage: DecorationImage(image: Image.asset(data.img!).image, fit: BoxFit.cover),
                          boxShape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
            ),
            Text(t14_txt_Travel2, style: boldTextStyle(size: 14)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
            ListView.builder(
                itemCount: travelStoryDetail.length,
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  SubscriptionModel data = travelStoryDetail[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.asset(data.userImg!, height: 30, width: 30, fit: BoxFit.cover),
                            ),
                            8.width,
                            Text(data.name!, style: boldTextStyle(size: 14)),
                          ],
                        ),
                        16.height,
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(data.img!, width: context.width(), height: 350, fit: BoxFit.cover),
                        ),
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
