import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAViewAllScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAZoomingScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAInboxFragment extends StatefulWidget {
  @override
  DAInboxFragmentState createState() => DAInboxFragmentState();
}

class DAInboxFragmentState extends State<DAInboxFragment> {
  List<DatingAppModel> list = getAllListData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    list.shuffle();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('New Matches', style: boldTextStyle()).paddingOnly(left: 16, top: 16),
              Container(
                height: 210,
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.take(12).length,
                  itemBuilder: (BuildContext context, int index) {
                    DatingAppModel matchList = list[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: commonCachedNetworkImage(
                          matchList.image,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 140,
                        ),
                      ),
                    ).onTap(() {
                      DAZoomingScreen(img: matchList.image).launch(context);
                    }, highlightColor: white, splashColor: white);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All Matches', style: boldTextStyle()),
                  Text('View All', style: boldTextStyle(color: primaryColor)).onTap(() {
                    DAViewAllScreen().launch(context);
                  }),
                ],
              ).paddingOnly(left: 16, right: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: list.map((e) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: commonCachedNetworkImage(
                          e.image,
                          fit: BoxFit.cover,
                          height: 170,
                          width: context.width() * 0.5-24,
                        ),
                      ),
                      Container(
                        height: 170,
                        width: context.width() * 0.5-24,
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(16),
                          backgroundColor: Colors.black26,
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.name.validate(), style: boldTextStyle(color: white), maxLines: 1, overflow: TextOverflow.ellipsis),
                            8.height,
                            Text(e.subTitle.validate(), style: secondaryTextStyle(color: white), maxLines: 1, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      )
                    ],
                  ).onTap(() {
                    DAZoomingScreen(img: e.image).launch(context);
                  }, highlightColor: white, splashColor: white);
                }).toList(),
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
