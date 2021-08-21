import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPAlbumsDetailScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPNowPlayingScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSongsScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

// ignore: must_be_immutable
class MPAlbumsScreen extends StatefulWidget {
  static String tag = '/ MPAlbumsScreen';
  bool? isTab = true;

  MPAlbumsScreen({this.isTab});

  @override
  MPAlbumsScreenState createState() => MPAlbumsScreenState();
}

class MPAlbumsScreenState extends State<MPAlbumsScreen> {
  List<MusicModel> trendingList = getAlbumsList();
  List<MusicModel> topAlbumList = getAlbumGridList();

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: mpAppBackGroundColor,
        appBar: widget.isTab!
            ? null
            : AppBar(
                backgroundColor: mpAppBackGroundColor,
                title: Text("Albums", style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
                centerTitle: true,
                automaticallyImplyLeading: true,
                iconTheme: IconThemeData(color: white.withOpacity(0.9)),
                elevation: 0.0,
                actions: [
                  searchIconWidget(onPressed: () {
                    MPSearchScreen().launch(context);
                  }),
                ],
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Trending', style: boldTextStyle(color: Colors.white)),
                  Text('View All', style: primaryTextStyle(color: mpAppButtonColor)).paddingOnly(right: 8).onTap(() {
                    MPSongsScreen().launch(context);
                  }),
                ],
              ).paddingOnly(left: 16, right: 16),
              16.height,
              Container(
                height: 180,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingList.length,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = trendingList[index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 130, width: 250, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                          MPAlbumsDetailScreen(data: data).launch(context);
                        }),
                        4.height,
                        Text(data.title!, style: primaryTextStyle(color: Colors.white)),
                        4.height,
                        Text(data.subtitle!, style: secondaryTextStyle(color: Colors.grey)),
                      ],
                    ).paddingOnly(left: 8, right: 8);
                  },
                ),
              ),
              8.height,
              Divider(color: Colors.grey),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Albums', style: boldTextStyle(color: Colors.white)).onTap(() {}),
                  Text('View All', style: primaryTextStyle(color: mpAppButtonColor)).paddingOnly(right: 8).onTap(() {
                    MPSongsScreen().launch(context);
                  }),
                ],
              ).paddingOnly(left: 16, right: 16),
              16.height,
              Wrap(
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.center,
                spacing: 16.0,
                children: List.generate(
                  topAlbumList.length,
                  (index) {
                    MusicModel data = topAlbumList[index];

                    return Container(
                      width: context.width() * 0.43,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonCacheImageWidget(data.img, 170, fit: BoxFit.cover).cornerRadiusWithClipRRect(8).onTap(() {
                            MPNowPlayingScreen(data: data).launch(context);
                          }),
                          8.height,
                          Text(data.title!, style: boldTextStyle(color: Colors.white), maxLines: 1),
                          4.height,
                          Text(data.subtitle!, style: primaryTextStyle(color: Colors.grey, size: 14), maxLines: 1),
                        ],
                      ),
                    ).onTap(() {
                      MPNowPlayingScreen(data: data).launch(context);
                    });
                  },
                ),
              ).paddingOnly(bottom: 70)
            ],
          ),
        ),
      ),
    );
  }
}
