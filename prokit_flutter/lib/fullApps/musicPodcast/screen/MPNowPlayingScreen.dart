import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPNowPlayingScreen extends StatefulWidget {
  final MusicModel? data;

  MPNowPlayingScreen({this.data});

  static String tag = '/MPNowPlayingScreen';

  @override
  MPNowPlayingScreenState createState() => MPNowPlayingScreenState();
}

class MPNowPlayingScreenState extends State<MPNowPlayingScreen> {
  double _currentSliderValue = 60;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<MusicModel> list = getAlbumGridList();

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
          icon: Icon(Icons.menu, color: white.withOpacity(0.9)),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        backgroundColor: mpAppBackGroundColor,
        elevation: 0.0,
        title: Text("Now Playing", style: boldTextStyle(color: Colors.white.withOpacity(0.9))),
        actions: [
          searchIconWidget(onPressed: () {
            MPSearchScreen().launch(context);
          }),
        ],
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.add_circle_outline_rounded, size: 20, color: Colors.white).onTap(() {
                  showBottom(context);
                }),
                Icon(Icons.send, color: Colors.white, size: 20).onTap(() {
                  toast("send", bgColor: Colors.white, textColor: Colors.black);
                }),
              ],
            ).paddingOnly(left: 16, right: 16),
            32.height,
            commonCacheImageWidget(widget.data!.img, 360, width: 240, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
            16.height,
            Text(widget.data!.title!, style: boldTextStyle(color: Colors.white)),
            8.height,
            Text(widget.data!.subtitle!, style: secondaryTextStyle(color: Colors.white.withOpacity(0.5))),
            32.height,
            Slider(
              inactiveColor: Colors.white,
              activeColor: mpAppButtonColor,
              value: _currentSliderValue,
              min: 0,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            22.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.arrow_back_ios, size: 25, color: Colors.white).onTap(() {
                  toast('Previous', bgColor: Colors.white, textColor: Colors.black);
                }),
                Icon(Icons.play_circle_outline, color: mpAppButtonColor, size: 30).onTap(() {
                  toast('Play', bgColor: Colors.white, textColor: Colors.black);
                }),
                Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 25).onTap(() {
                  toast('Next', bgColor: Colors.white, textColor: Colors.black);
                }),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }

  Future<void> showBottom(BuildContext context) async {
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
                  Text(''),
                  Text('Save Here', style: boldTextStyle()),
                  Icon(Icons.add, color: Colors.grey).paddingOnly(right: 8),
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
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = list[index];

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
              Text('Cancel', style: secondaryTextStyle(size: 13, color: Colors.grey)).center().onTap(() {
                finish(context);
              })
            ],
          ),
        );
      },
    );
  }
}
