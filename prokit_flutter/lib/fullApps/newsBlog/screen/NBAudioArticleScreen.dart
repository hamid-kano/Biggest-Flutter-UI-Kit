import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/component/NBAudioNewsComponent.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';

class NBAudioArticleScreen extends StatefulWidget {
  static String tag = '/NBAudioArticleScreen';

  @override
  NBAudioArticleScreenState createState() => NBAudioArticleScreenState();
}

class NBAudioArticleScreenState extends State<NBAudioArticleScreen> with SingleTickerProviderStateMixin {
  int pageIndex = 0;

  PageController? pageController;
  TabController? tabController;

  List<NBNewsDetailsModel> mNewsList = nbGetNewsDetails();
  List<NBBannerItemModel> pages = nbGetBannerItems();
  List<NBNewsDetailsModel> mTechNewsList = [], mFashionNewsList = [], mSportsNewsList = [], mScienceNewsList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController = PageController(initialPage: pageIndex, viewportFraction: 1);
    tabController = TabController(length: 5, vsync: this);
    mNewsList.forEach((element) {
      if (element.categoryName == 'Technology') {
        mTechNewsList.add(element);
      } else if (element.categoryName == 'Fashion') {
        mFashionNewsList.add(element);
      } else if (element.categoryName == 'Sports') {
        mSportsNewsList.add(element);
      } else if (element.categoryName == 'Science') {
        mScienceNewsList.add(element);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: ScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 350,
              backgroundColor: white,
              title: Text(
                'Audio Article',
                style: boldTextStyle(size: 20, color: black),
              ),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: PageView(
                          controller: pageController,
                          children: List.generate(pages.length, (index) {
                            return Stack(
                              children: [
                                Image.asset(
                                  pages[index].image!,
                                  fit: BoxFit.fill,
                                  width: context.width(),
                                ).cornerRadiusWithClipRRect(16),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  height: 200,
                                  padding: EdgeInsets.all(8),
                                  color: black.withOpacity(0.25),
                                  child: Row(
                                    children: [
                                      LinearProgressIndicator(
                                        backgroundColor: grey,
                                        value: 0.5,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ).expand(),
                                      8.width,
                                      Text('40:15', style: primaryTextStyle(size: 14, color: white)),
                                    ],
                                  ),
                                ).cornerRadiusWithClipRRect(16),
                              ],
                            ).paddingOnly(left: 16, right: 16);
                          }),
                          onPageChanged: (value) {
                            setState(() {
                              pageIndex = value;
                            });
                          },
                        ),
                      ),
                      8.height,
                      DotIndicator(pageController: pageController!, pages: pages, indicatorColor: NBPrimaryColor),
                      16.height,
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: 'All News'),
                  Tab(text: 'Technology'),
                  Tab(text: 'Fashion'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Science'),
                ],
                labelStyle: boldTextStyle(),
                labelColor: black,
                unselectedLabelStyle: primaryTextStyle(),
                unselectedLabelColor: grey,
                isScrollable: true,
                indicatorColor: NBPrimaryColor,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            NBAudioNewsComponent(list: mNewsList),
            NBAudioNewsComponent(list: mTechNewsList),
            NBAudioNewsComponent(list: mFashionNewsList),
            NBAudioNewsComponent(list: mSportsNewsList),
            NBAudioNewsComponent(list: mScienceNewsList),
          ],
        ),
      ),
    );
    /*return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              finish(context);
            }),
        title: Text('Audio Article', style: boldTextStyle(color: black, size: 20)),
        backgroundColor: white,
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Continue Listening', style: boldTextStyle(size: 20)).paddingOnly(left: 16, right: 16),
            16.height,
            Container(
              height: 200,
              child: PageView(
                controller: pageController,
                children: List.generate(pages.length, (index) {
                  return Stack(
                    children: [
                      Image.asset(
                        pages[index].image,
                        fit: BoxFit.fill,
                        width: context.width(),
                      ).cornerRadiusWithClipRRect(16),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Row(
                          children: [
                            LinearProgressIndicator(
                              backgroundColor: grey,
                              value: 0.5,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ).expand(),
                            8.width,
                            Text('40:15', style: primaryTextStyle(size: 14, color: white)),
                          ],
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 16, right: 16);
                }),
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
              ),
            ),
            8.height,
            DotIndicator(pageController: pageController, pages: pages, indicatorColor: NBPrimaryColor),
            16.height,
            TabBar(
              tabs: [
                Tab(text: 'All News'),
                Tab(text: 'Technology'),
                Tab(text: 'Fashion'),
                Tab(text: 'Sports'),
                Tab(text: 'Science'),
              ],
              labelStyle: boldTextStyle(),
              labelColor: white,
              unselectedLabelStyle: primaryTextStyle(),
              unselectedLabelColor: grey,
              isScrollable: true,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(16), color: black),
            ).paddingOnly(left: 16, right: 16),
            16.height,
            TabBarView(
              children: [
                NBAudioNewsComponent(list: mNewsList),
                NBAudioNewsComponent(list: mTechNewsList),
                NBAudioNewsComponent(list: mFashionNewsList),
                NBAudioNewsComponent(list: mSportsNewsList),
                NBAudioNewsComponent(list: mScienceNewsList),
              ],
            ).expand(),
          ],
        ),
      ),
    );*/
  }
}
