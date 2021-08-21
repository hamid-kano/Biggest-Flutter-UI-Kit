import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';

class T14TravelScreen3 extends StatefulWidget {
  @override
  _T14TravelScreen3State createState() => _T14TravelScreen3State();
}

class _T14TravelScreen3State extends State<T14TravelScreen3> {
  List<SubscriptionModel> mostPopularList = getMostPopularList();
  List<SubscriptionModel> travel3StoryDetail = getTravel3StoryDetailList();

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
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: boxDecorationWithShadow(
              decorationImage: DecorationImage(image: Image.asset(t14_profile1).image, fit: BoxFit.cover),
              boxShape: BoxShape.circle,
            ),
          ).paddingOnly(right: 16, top: 8)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Where', style: boldTextStyle(color: t14_colorBlue, size: 16)).paddingAll(16),
            Text('Will you go today', style: secondaryTextStyle(size: 14)).paddingSymmetric(horizontal: 16),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                hintText: 'Find the spot',
                helperStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(Icons.search, color: t14_colorBlue),
                hintStyle: TextStyle(color: t14_colorBlue),
                filled: true,
                fillColor: t14_GreyColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: t14_colorWhite, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: t14_colorWhite, width: 0.5),
                ),
              ),
            ).paddingOnly(left: 16, right: 16, bottom: 24, top: 16),
            Text('Most popular', style: boldTextStyle(color: t14_colorBlue, size: 16)).paddingOnly(left: 16, right: 16, bottom: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Wrap(
                children: List.generate(mostPopularList.length, (index) {
                  SubscriptionModel data = mostPopularList[index];

                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(data.img!, width: 180, height: 250, fit: BoxFit.cover),
                            ),
                            8.height,
                            Positioned(
                              top: 8,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: 40,
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: t14_GreyColor.withOpacity(0.5)),
                                child: Text('3.8', textAlign: TextAlign.center, style: primaryTextStyle(color: t14_colorWhite, size: 16)),
                              ),
                            ),
                          ],
                        ),
                        8.height,
                        Text(data.name!, style: secondaryTextStyle(size: 14)),
                        4.height,
                        Text(data.country!, style: secondaryTextStyle(size: 14)),
                      ],
                    ),
                  );
                }),
              ),
            ),
            ListView.builder(
                itemCount: travel3StoryDetail.length,
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  SubscriptionModel data = travel3StoryDetail[index];
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.asset(data.userImg!, height: 35, width: 35, fit: BoxFit.cover),
                            ),
                            8.width,
                            Text(data.name!, style: boldTextStyle(size: 14)).expand(),
                            Icon(Icons.location_on_outlined, size: 18),
                            Text(data.country!, style: boldTextStyle(size: 14)),
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
