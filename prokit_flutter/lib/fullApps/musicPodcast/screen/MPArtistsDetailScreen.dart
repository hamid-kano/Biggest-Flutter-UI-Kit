import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSongsScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPArtistsDetailScreen extends StatefulWidget {
  final String? img;

  MPArtistsDetailScreen({this.img});

  @override
  MPArtistsDetailScreenState createState() => MPArtistsDetailScreenState();
}

class MPArtistsDetailScreenState extends State<MPArtistsDetailScreen> {
  List<MusicModel> podCastDetailList = getPodCastDetailList();
  List<MusicModel> artistsDetailAlbumList = getArtistsDetailAlbumList();

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
        title: Text('Artists Detail', style: boldTextStyle(color: white.withOpacity(0.9), size: 18)),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: white.withOpacity(0.9)),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                commonCacheImageWidget(widget.img, 250, width: context.width(), fit: BoxFit.cover),
                Container(color: black.withOpacity(0.7), height: 250, width: context.width()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(lipsum.createWord(numWords: 2), style: boldTextStyle(color: white.withOpacity(0.9))),
                        8.height,
                        Text('138 Episodes', style: secondaryTextStyle(color: mpAppTextColor)),
                      ],
                    ),
                  ],
                ).center().paddingOnly(top: 30),
                Positioned(
                  bottom: 16,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('4,125', style: boldTextStyle(color: white.withOpacity(0.9), size: 14)),
                          8.height,
                          Text('Followers', style: secondaryTextStyle(color: mpAppTextColor)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('14,125', style: boldTextStyle(color: white.withOpacity(0.9), size: 14)),
                          8.height,
                          Text('Listeners', style: secondaryTextStyle(color: mpAppTextColor)),
                        ],
                      ),
                      AppButton(
                        child: Text('Follow', style: boldTextStyle(color: Colors.white, size: 14)),
                        color: mpAppButtonColor,
                        width: 110,
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        onTap: () {},
                      ).cornerRadiusWithClipRRect(16),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Albums', style: boldTextStyle(color: white.withOpacity(0.9))),
                Text('View All', style: secondaryTextStyle(color: mpAppButtonColor)).onTap(() {
                  MPSongsScreen().launch(context);
                }),
              ],
            ).paddingOnly(left: 16, right: 16, top: 16),
            Container(
              height: 215,
              child: ListView.builder(
                itemCount: artistsDetailAlbumList.length,
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  MusicModel data = artistsDetailAlbumList[index];

                  return Container(
                    margin: EdgeInsets.all(8),
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 130, width: 130, fit: BoxFit.cover).cornerRadiusWithClipRRect(14),
                        8.height,
                        Text(data.title!, overflow: TextOverflow.ellipsis, maxLines: 1, style: boldTextStyle(color: white)).expand(),
                        4.height,
                        Text(data.number.toString(), style: secondaryTextStyle(color: mpAppTextColor)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(color: white.withOpacity(0.1)),
            4.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Songs', style: boldTextStyle(color: white.withOpacity(0.9))),
                Text('View All', style: secondaryTextStyle(color: mpAppButtonColor)).onTap(() {
                  MPSongsScreen().launch(context);
                }),
              ],
            ).paddingOnly(left: 16, right: 16),
            ListView.separated(
              itemCount: podCastDetailList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 40),
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = podCastDetailList[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.play_circle_outline, color: mpAppButtonColor),
                        16.width,
                        Text(data.title!, style: boldTextStyle(color: white, size: 14)).expand(),
                        Text(data.number1.toString(), style: secondaryTextStyle(color: white, size: 12)),
                        24.width,
                        Icon(Icons.more_horiz, color: white.withOpacity(0.9)),
                      ],
                    ),
                    8.height,
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(height: 70, child: playMusicWidget(context)),
    );
  }
}
