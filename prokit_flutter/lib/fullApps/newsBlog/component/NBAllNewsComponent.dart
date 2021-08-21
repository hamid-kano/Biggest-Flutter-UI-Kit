import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/component/NBNewsComponent.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBShowMoreNewsScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';

class NBAllNewsComponent extends StatefulWidget {
  static String tag = '/NBAllNewsComponent';

  @override
  NBAllNewsComponentState createState() => NBAllNewsComponentState();
}

class NBAllNewsComponentState extends State<NBAllNewsComponent> {
  PageController? pageController;
  int pageIndex = 0;

  List<NBBannerItemModel> mBannerItems = nbGetBannerItems();
  List<NBNewsDetailsModel> mNewsList = nbGetNewsDetails();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController = PageController(initialPage: pageIndex, viewportFraction: 0.9);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          Container(
            height: 200,
            child: PageView(
              controller: pageController,
              children: List.generate(mBannerItems.length, (index) {
                return Image.asset(mBannerItems[index].image!, fit: BoxFit.fill).cornerRadiusWithClipRRect(16).paddingRight(pageIndex < 2 ? 16 : 0);
              }),
              onPageChanged: (value) {},
            ),
          ),
          8.height,
          DotIndicator(pageController: pageController!, pages: mBannerItems, indicatorColor: NBPrimaryColor),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest News', style: boldTextStyle(size: 20)),
              Text('Show More', style: boldTextStyle(color: NBPrimaryColor)).onTap(() {
                NBShowMoreNewsScreen().launch(context);
              }),
            ],
          ).paddingOnly(left: 16, right: 16),
          NBNewsComponent(list: mNewsList),
        ],
      ),
    );
  }
}
