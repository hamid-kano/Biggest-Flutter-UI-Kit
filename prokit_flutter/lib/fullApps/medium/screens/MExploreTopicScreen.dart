import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';

import 'MAudioArticlesScreen.dart';

class MExploreTopicScreen extends StatefulWidget {
  static String tag = '/MTopicListScreen';

  @override
  MExploreTopicScreenState createState() => MExploreTopicScreenState();
}

class MExploreTopicScreenState extends State<MExploreTopicScreen> {
  List<MTopicModel> topicList = getTopicList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Explore Topics', color: black, textColor: white),
      body: Container(
        color: Colors.black87,
        child: GridView.builder(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          itemCount: topicList.length,
          itemBuilder: (_, i) {
            MTopicModel data = topicList[i];
            return Stack(
              children: [
                commonCacheImageWidget(data.img.validate(), 200, width: 200, fit: BoxFit.fill).cornerRadiusWithClipRRect(8),
                Container(
                  height: 200,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(8),
                  decoration: boxDecoration(bgColor: mLimeColor.withOpacity(0.82), radius: 8),
                  child: Text(data.title.validate(), style: boldTextStyle(size: 16, color: white), maxLines: 2, overflow: TextOverflow.ellipsis),
                )
              ],
            ).paddingOnly(left: 8, right: 8, top: 8, bottom: 8).onTap(() {
              MAudioArticlesScreen(appBarTitle: data.title).launch(context);
            });
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 0, childAspectRatio: 10 / 8),
        ),
      ),
    );
  }
}
