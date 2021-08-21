import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPSearchScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPEventsScreen extends StatefulWidget {
  final String? name;

  MPEventsScreen({this.name});

  static String tag = '/MPEventsScreen';

  @override
  MPEventsScreenState createState() => MPEventsScreenState();
}

class MPEventsScreenState extends State<MPEventsScreen> {
  List<NewsList> newsList = getNewsList();
  List<MusicModel> eventDateList = getDateList();
  List<MusicModel> eventList = getEventsList();

  int current = 3;
  int i = 1;

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
          children: [
            16.height,
            Container(
              height: 180,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.horizontal,
                itemCount: eventList.length,
                itemBuilder: (BuildContext context, int index) {
                  MusicModel data = eventList[index];

                  return Stack(
                    children: [
                      commonCacheImageWidget(data.img, 170, width: 280, fit: BoxFit.cover).cornerRadiusWithClipRRect(10).onTap(() {
                        setState(() {});
                      }),
                      Positioned(
                        left: 14,
                        bottom: 16,
                        right: 0,
                        child: Text(data.title!, style: boldTextStyle(color: white.withOpacity(0.9)), maxLines: 2),
                      )
                    ],
                  ).paddingOnly(left: 8, right: 8);
                },
              ),
            ),
            16.height,
            Stack(
              children: [
                Divider(thickness: 2, color: mpAppTextColor1),
                Container(
                  height: 40,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: eventDateList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            color: current == index ? mpAppButtonColor : Colors.white,
                          ).cornerRadiusWithClipRRect(10).paddingOnly(top: 5),
                          16.width,
                          4.height,
                          Text(eventDateList[index].title!, style: boldTextStyle(color: current == index ? mpAppButtonColor : Colors.grey)),
                        ],
                      ).paddingOnly(left: 8, right: 8).onTap(() {
                        current = index;
                        setState(() {});
                      });
                    },
                  ),
                )
              ],
            ),
            16.height,
            Text('Today', style: boldTextStyle(color: white.withOpacity(0.9))),
            16.height,
            ListView.builder(
              itemCount: newsList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                NewsList data = newsList[index];

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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
