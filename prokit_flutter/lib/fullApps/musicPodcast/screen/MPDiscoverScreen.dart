import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPNowPlayingScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSelectSongTypeScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSongsScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';

class MPDiscoverScreen extends StatefulWidget {
  static String tag = '/MPDiscoverScreen';

  @override
  MPDiscoverScreenState createState() => MPDiscoverScreenState();
}

class MPDiscoverScreenState extends State<MPDiscoverScreen> {
  List<MusicModel> hotRecommendedList = getDisCoverList();
  List<MusicModel> hotPlaylist = getDisCoverGridList();

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Hot Recommended', style: boldTextStyle(color: Colors.white)).paddingOnly(left: 16),
              8.height,
              Container(
                height: 190,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: hotRecommendedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = hotRecommendedList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 130, width: 250, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                        4.height,
                        Text(data.title!, style: primaryTextStyle(color: Colors.white)),
                        4.height,
                        Text(data.subtitle!, style: secondaryTextStyle(color: Colors.grey)),
                      ],
                    ).paddingOnly(left: 8, right: 8).onTap(() {
                      MPSelectSongTypeScreen().launch(context);
                    });
                  },
                ),
              ),
              Divider(color: Colors.grey),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hot Playlists', style: boldTextStyle(color: Colors.white)),
                  Text('View All', style: primaryTextStyle(color: mpAppButtonColor)).paddingOnly(right: 8).onTap(() {
                    MPSongsScreen().launch(context);
                  }),
                ],
              ).paddingOnly(left: 16, right: 16),
              4.height,
              Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 4.0,
                spacing: 8.0,
                children: List.generate(
                  hotPlaylist.length,
                  (index) {
                    MusicModel data = hotPlaylist[index];

                    return Container(
                      width: context.width() * 0.42,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonCacheImageWidget(data.img, 170, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                            MPNowPlayingScreen(data: data).launch(context);
                          }),
                          4.height,
                          Text(data.title!, style: boldTextStyle(color: Colors.white), maxLines: 1),
                          4.height,
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  data.isSelect ? Icons.favorite : Icons.favorite_border,
                                  color: data.isSelect ? mpAppButtonColor : mpAppButtonColor,
                                ).onTap(() {
                                  setState(() {
                                    data.isSelect = !data.isSelect;
                                  });
                                }),
                                4.width,
                                Text(data.number.toString(), style: secondaryTextStyle(color: Colors.white.withOpacity(0.5))),
                                6.width,
                                Icon(Icons.add_circle_outline_rounded, color: mpAppButtonColor, size: 20),
                                4.width,
                                Text(data.subtitle!, style: secondaryTextStyle(color: Colors.white.withOpacity(0.5))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ).onTap(() {
                      MPNowPlayingScreen(data: data).launch(context);
                    });
                  },
                ),
              ).center().paddingOnly(bottom: 70)
            ],
          ),
        ),
      ),
    );
  }
}
