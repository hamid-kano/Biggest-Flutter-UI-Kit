import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPNowPlayingScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPSongsScreen extends StatefulWidget {
  @override
  MPSongsScreenState createState() => MPSongsScreenState();
}

class MPSongsScreenState extends State<MPSongsScreen> {
  List<MusicModel> disCoverList = getDisCoverList();
  List<MusicModel> songsList = getSongsList();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: white.withOpacity(0.9)),
        ),
        backgroundColor: mpAppBackGroundColor,
        elevation: 0.0,
        title: Text("Songs", style: boldTextStyle(color: Colors.white.withOpacity(0.9))),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      drawer: DrawerScreen(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Popular Songs', style: boldTextStyle(color: white.withOpacity(0.9))).paddingOnly(left: 16, right: 16),
                Container(
                  height: 200,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: disCoverList.length,
                    itemBuilder: (BuildContext context, int index) {
                      MusicModel data = disCoverList[index];

                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonCacheImageWidget(data.img, 130, width: 130, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                              MPNowPlayingScreen(data: data).launch(context);
                            }),
                            8.height,
                            Text(data.title!, maxLines: 1, overflow: TextOverflow.ellipsis, style: primaryTextStyle(color: Colors.white)),
                            Text(data.subtitle!, style: secondaryTextStyle(color: Colors.grey)),
                          ],
                        ).paddingOnly(left: 8, right: 8),
                      ).onTap(() {});
                    },
                  ),
                ),
                Divider(color: white.withOpacity(0.1)),
                8.height,
                Text('Friend Favorite Songs', style: boldTextStyle(color: white.withOpacity(0.9))).paddingOnly(left: 16, right: 16),
                ListView.separated(
                  itemCount: songsList.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 50),
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = songsList[index];

                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.play_circle_outline, color: mpAppButtonColor),
                          24.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title!, style: boldTextStyle(color: white)),
                              4.height,
                              Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                            ],
                          ).expand(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                data.like! ? Icons.favorite_border : Icons.favorite,
                                color: data.like! ? mpAppButtonColor.withOpacity(0.5) : mpAppButtonColor,
                              ).onTap(() {
                                setState(() {
                                  data.like = !data.like!;
                                });
                              }),
                              8.height,
                              RatingBar.builder(
                                initialRating: data.number1!,
                                minRating: 1,
                                itemSize: 15,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                unratedColor: gray,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(Icons.star, color: mpAppButtonColor),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: playMusicWidget(context)),
        ],
      ),
    );
  }
}
