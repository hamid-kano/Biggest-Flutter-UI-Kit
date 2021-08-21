import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPPlayListDetailScreen extends StatefulWidget {
  final MusicModel? data;

  MPPlayListDetailScreen({this.data});

  @override
  MPPlayListDetailScreenState createState() => MPPlayListDetailScreenState();
}

class MPPlayListDetailScreenState extends State<MPPlayListDetailScreen> {
  List<MusicModel> playDetailList = getPlayDetailList();

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
        title: Text('Playlist Detail', style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: white.withOpacity(0.9)),
          onPressed: () {
            finish(context);
          },
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                commonCacheImageWidget(widget.data!.img, 240, width: context.width(), fit: BoxFit.cover),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: cardBackgroundBlackDark.withOpacity(0.9),
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    width: context.width(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.data!.title!, style: boldTextStyle(color: white.withOpacity(0.9))),
                            4.height,
                            Text('23 Songs', style: secondaryTextStyle(color: white.withOpacity(0.5))),
                          ],
                        ),
                        Column(
                          children: [
                            commonCacheImageWidget(mpImages_16, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                            8.height,
                            Row(
                              children: [
                                Icon(Icons.access_time, color: white, size: 18),
                                12.width,
                                Text('42.35', style: secondaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.play_circle_outline, color: mpAppButtonColor, size: 24),
                16.width,
                Text('Play All (23)', style: boldTextStyle(color: white.withOpacity(0.9), size: 16)),
              ],
            ).paddingOnly(left: 16, top: 16),
            ListView.separated(
              itemCount: playDetailList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 40),
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = playDetailList[index];

                return Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(data.number.toString(), style: boldTextStyle(color: white.withOpacity(0.9))),
                      16.width,
                      commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title!, style: boldTextStyle(color: white.withOpacity(0.9))),
                          4.height,
                          Text(data.subtitle!, style: secondaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                        ],
                      ).expand(),
                      Icon(Icons.more_horiz, color: white.withOpacity(0.9)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
