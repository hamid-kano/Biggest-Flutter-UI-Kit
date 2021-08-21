import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPNowPlayingScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSongsScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPOurChoicesScreen extends StatefulWidget {
  @override
  MPOurChoicesScreenState createState() => MPOurChoicesScreenState();
}

class MPOurChoicesScreenState extends State<MPOurChoicesScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<MusicModel> trendList1 = getTrendList1();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: white),
        ),
        backgroundColor: mpAppBackGroundColor,
        bottom: TabBar(
          unselectedLabelColor: white.withOpacity(0.7),
          labelColor: white,
          tabs: [
            Tab(child: Text('Trend')),
            Tab(child: Text('Recommended')),
          ],
          controller: _tabController,
          indicatorColor: mpAppButtonColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        title: Container(
          height: 40,
          width: context.width(),
          child: AppTextField(
            controller: TextEditingController(),
            textStyle: primaryTextStyle(color: Colors.white.withOpacity(0.4)),
            textFieldType: TextFieldType.EMAIL,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.2)),
              fillColor: mpSearchBarBackGroundColor,
              hintText: 'Search album, song...',
              hintStyle: primaryTextStyle(color: Colors.white.withOpacity(0.4)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
              enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
            ),
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 16),
            decoration: boxDecorationWithShadow(
              boxShape: BoxShape.circle,
              decorationImage: DecorationImage(image: Image
                  .network(mpImages_13)
                  .image, fit: BoxFit.cover),
            ),
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: TabBarView(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Our Choices For You", style: boldTextStyle(color: white)).paddingOnly(left: 16, top: 16),
                Container(
                  height: 210,
                  child: ListView.builder(
                    itemCount: trendList1.length,
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      MusicModel data = trendList1[index];

                      return Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonCacheImageWidget(data.img, 120, width: 250, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                            8.height,
                            Text(data.title!, style: boldTextStyle(color: white)),
                            4.height,
                            Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                          ],
                        ),
                      ).onTap(() {
                        MPNowPlayingScreen(data: data).launch(context);
                      });
                    },
                  ),
                ),
                Divider(color: white.withOpacity(0.1)),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Radio Station', style: boldTextStyle(color: white.withOpacity(0.8))),
                    Text('View All', style: secondaryTextStyle(color: mpAppButtonColor)).onTap(() {
                      MPSongsScreen().launch(context);
                    }),
                  ],
                ).paddingOnly(left: 16, right: 16),
                ListView.separated(
                  itemCount: trendList1.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 70),
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    MusicModel data = trendList1[index];

                    return Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                          16.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title!, style: boldTextStyle(color: white)),
                              4.height,
                              Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                            ],
                          ).expand(),
                          Icon(Icons.play_circle_outline, color: mpAppButtonColor),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: ListView.separated(
              itemCount: trendList1.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.1), indent: 70),
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = trendList1[index];

                return Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title!, style: boldTextStyle(color: white)),
                          4.height,
                          Text(data.subtitle!, style: primaryTextStyle(color: white.withOpacity(0.5), size: 14)),
                        ],
                      ).expand(),
                      Icon(Icons.play_circle_outline, color: mpAppButtonColor),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Container(height: 70, child: playMusicWidget(context)),
    );
  }
}
