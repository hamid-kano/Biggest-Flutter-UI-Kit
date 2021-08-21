import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';

class T14TravelScreen4 extends StatefulWidget {
  @override
  _T14TravelScreen4State createState() => _T14TravelScreen4State();
}

class _T14TravelScreen4State extends State<T14TravelScreen4> {
  List<TravelModel> travelList = getTravelList();

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
        title: Text('Explore', style: boldTextStyle(color: t14_colorBlue, size: 18)),
        centerTitle: true,
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: boxDecorationWithShadow(
              decorationImage: DecorationImage(image: Image.asset(t14_profile1).image, fit: BoxFit.cover),
              boxShape: BoxShape.circle,
            ),
          ).paddingOnly(right: 8, top: 8)
        ],
      ),
      body: ListView.builder(
          itemCount: travelList.length,
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            TravelModel data = travelList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(data.img!, height: 35, width: 35, fit: BoxFit.cover),
                    ),
                    8.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name!, style: boldTextStyle(size: 14, color: t14_colorBlue)),
                        Text(data.lastSeen!, style: secondaryTextStyle(size: 12)),
                      ],
                    )
                  ],
                ),
                16.height,
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(data.placeImg!, width: context.width(), height: 190, fit: BoxFit.cover),
                ),
                8.height,
                Row(
                  children: [
                    Icon(data.like ? Icons.favorite : Icons.favorite_border, color: t14_RedColor, size: 20).onTap(() {
                      setState(() {
                        data.like = !data.like;
                      });
                    }),
                    8.width,
                    Text(data.totalLike.toString(), style: primaryTextStyle(size: 14)),
                    4.width,
                    Text('likes', style: primaryTextStyle(size: 14)),
                  ],
                ),
                8.height,
                Text.rich(
                  TextSpan(
                    text: data.placeName,
                    style: boldTextStyle(size: 14),
                    children: <TextSpan>[
                      TextSpan(text: data.placeDescription, style: secondaryTextStyle(size: 14)),
                    ],
                  ),
                ),
                8.height,
                Row(
                  children: [
                    Text('See', style: secondaryTextStyle(size: 14)),
                    4.width,
                    Text(data.totalComment.toString(), style: secondaryTextStyle(size: 14)),
                    4.width,
                    Text("comments", style: secondaryTextStyle(size: 14)),
                    8.width,
                    Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: t14_SuccessTxtColor)
                  ],
                ),
              ],
            ).paddingAll(8);
          }),
    );
  }
}
