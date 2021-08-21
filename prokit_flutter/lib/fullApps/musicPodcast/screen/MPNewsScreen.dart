import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPNewsDetailScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPNewsScreen extends StatefulWidget {
  final String? name;

  MPNewsScreen({this.name});

  @override
  MPNewsScreenState createState() => MPNewsScreenState();
}

class MPNewsScreenState extends State<MPNewsScreen> {
  List<NewsList> recentNewsList = getNewsList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        backgroundColor: mpAppBackGroundColor,
        title: Text(widget.name!, style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending', style: boldTextStyle(color: white.withOpacity(0.9))).paddingOnly(left: 16),
            8.height,
            Container(
              height: 230,
              child: ListView.builder(
                itemCount: recentNewsList.length,
                padding: EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  NewsList data = recentNewsList[index];
                  return Container(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 150, width: 230, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                        8.height,
                        Text(data.name!, style: boldTextStyle(color: white.withOpacity(0.9))),
                        8.height,
                        Text(data.description!, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: mpAppTextColor1)),
                      ],
                    ),
                  ).onTap(() {
                    MPNewsDetailScreen().launch(context);
                  }).paddingOnly(left: 8, right: 8);
                },
              ),
            ),
            8.height,
            Text('Recent News', style: boldTextStyle(color: white.withOpacity(0.9))).paddingSymmetric(horizontal: 16),
            ListView.builder(
              itemCount: recentNewsList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                NewsList data = recentNewsList[index];

                return Container(
                  color: mpAppCardColor,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle(color: white.withOpacity(0.9))),
                          4.height,
                          Text(data.description!, maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: mpAppTextColor1)),
                        ],
                      ).expand()
                    ],
                  ),
                ).onTap(() {
                  MPNewsDetailScreen().launch(context);
                });
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(height: 70, child: playMusicWidget(context)),
    );
  }
}
