import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPAlbumsDetailScreen extends StatefulWidget {
  final MusicModel? data;

  MPAlbumsDetailScreen({this.data});

  static String tag = '/MPAlbumsDetailScreen';

  @override
  MPAlbumsDetailScreenState createState() => MPAlbumsDetailScreenState();
}

class MPAlbumsDetailScreenState extends State<MPAlbumsDetailScreen> {
  List<MusicModel> albumDetailList = getAlbumDetailList();
  List<MusicModel> albumGridList = getAlbumGridList();

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
      appBar: AppBar(
        title: Text('Album Detail').center(),
        backgroundColor: mpAppBackGroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      backgroundColor: mpAppBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                commonCacheImageWidget(widget.data!.img, 300, width: context.width(), fit: BoxFit.cover),
                Container(height: 300, color: Colors.black.withOpacity(0.8)),
                Positioned(
                  left: 16,
                  top: 32,
                  child: Row(
                    children: [
                      commonCacheImageWidget(widget.data!.img, 130, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data!.title!, style: boldTextStyle(color: Colors.white)),
                          8.height,
                          Text(widget.data!.subtitle!, style: secondaryTextStyle(color: Colors.white)),
                          8.height,
                          Row(
                            children: [
                              Text("2018 . ", style: secondaryTextStyle(color: Colors.white)),
                              Text("10 song .", style: secondaryTextStyle(color: Colors.white)),
                              Text(" 57 min", style: secondaryTextStyle(color: Colors.white)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 32,
                  bottom: 32,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: mpAppButtonColor),
                        child: Row(
                          children: [
                            Icon(Icons.play_arrow_outlined, color: Colors.white),
                            4.width,
                            Text('Play', style: boldTextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      32.width,
                      Container(
                        width: 100,
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Icon(Icons.share_sharp, color: Colors.white),
                            4.width,
                            Text('Share', style: boldTextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      32.width,
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons.favorite_border, size: 18, color: Colors.white),
                        decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(20))),
                      ).cornerRadiusWithClipRRect(20).onTap(() {
                        showAddPlayList();
                      })
                    ],
                  ),
                )
              ],
            ),
            16.height,
            ListView.separated(
              padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.3), indent: 50),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: albumDetailList.length,
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = albumDetailList[index];

                return Row(
                  children: [
                    Icon(Icons.play_circle_fill_outlined, color: mpAppButtonColor),
                    16.width,
                    Text(data.title!, style: primaryTextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, maxLines: 1).expand(),
                    Text(data.subtitle!, style: primaryTextStyle(color: Colors.white)),
                    8.width,
                    Icon(Icons.more_horiz, color: Colors.white)
                  ],
                ).paddingOnly(top: 8, bottom: 8, left: 8, right: 8);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> showAddPlayList() async {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text('Add Playlist', style: boldTextStyle()),
                  Icon(Icons.close, color: Colors.grey).onTap(() {
                    finish(context);
                  }).paddingOnly(right: 8),
                ],
              ),
              8.height,
              Divider(thickness: 1),
              8.height,
              Container(
                height: 130,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: albumGridList.length,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = albumGridList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(data.img, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                        4.height,
                        Text(data.title!, style: secondaryTextStyle(size: 13, color: Colors.grey), maxLines: 1),
                      ],
                    ).paddingOnly(left: 8, right: 8);
                  },
                ),
              ),
              Divider(thickness: 1),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.grey),
                  Text('Create New Playlist', style: secondaryTextStyle(size: 13, color: Colors.grey)).center(),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
