// import 'package:prokit_flutter/fullApps/medium/model/MModel.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MAudioArticlesScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MBecomeAMemberScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MDashBoardScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MInterestsScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MNewStoryScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MPostDetailsScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MProfileScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MReadingListScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MSettingScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MStatsScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/screen/MStoriesScreen.dart';
// import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
// import 'package:prokit_flutter/soicalNetwork/utils/SNImages.dart';
// import 'package:prokit_flutter/main/utils/AppColors.dart';
// import 'package:prokit_flutter/main/utils/AppImages.dart';
// import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MAudioArticlesScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MBecomeAMemberScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MDashBoardScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MInterestsScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MNewStoryScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MPostDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MProfileScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MReadingListScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MSettingScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MStatsScreen.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MStoriesScreen.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MImages.dart';
import 'package:share/share.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width(),
          color: black,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(backgroundImage: AssetImage(mCatSoftware), radius: 45),
              8.height,
              Text('Smith John', style: boldTextStyle(color: white)),
              Text('View profile', style: secondaryTextStyle(size: 14)),
            ],
          ),
        ).onTap(() {
          finish(context);
          MProfileScreen().launch(context);
        }),
        Container(
          width: context.width(),
          color: Colors.black87,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Home', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                finish(context);
                MDashBoardScreen().launch(context);
              }),
              16.height,
              Text('Audio', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MAudioArticlesScreen(appBarTitle: "Audio Articles").launch(context);
              }),
              16.height,
              Text('Reading List', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MReadingListScreen().launch(context);
              }),
              16.height,
              Text('Interests', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MInterestsScreen().launch(context);
              }),
              24.height,
              Text('Become a member', style: secondaryTextStyle(size: 16, color: mLimeColor)).onTap(() {
                finish(context);
                MBecomeAMemberScreen().launch(context);
              }),
              24.height,
              Text('New Story', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MNewStoryScreen().launch(context);
              }),
              16.height,
              Text('Stats', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MStatsScreen().launch(context);
              }),
              16.height,
              Text('Stories', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MStoriesScreen().launch(context);
              }),
            ],
          ),
        ).expand(),
        Container(
          height: 50,
          width: context.width(),
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              8.width,
              Image.asset(app_ic_medium, height: 30, width: 30, color: white),
              32.width,
              Text('Settings', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
                MSettingScreen().launch(context);
              }),
              Text('Help', style: secondaryTextStyle(size: 16)).onTap(() {
                finish(context);
              }),
              32.width,
            ],
          ).paddingAll(8),
        )
      ],
    );
  }
}

class MCommonList extends StatelessWidget {
  const MCommonList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<MListModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) {
        MListModel data = list[i];
        return Container(
          color: black,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BASED ON YOUR READING HISTORY', style: secondaryTextStyle(size: 14)),
              4.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.title.validate(), style: primaryTextStyle(color: white, size: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(data.subtitle.validate(), style: secondaryTextStyle(), maxLines: 2),
                      8.height,
                      Row(
                        children: [
                          Text(data.date.validate(), style: secondaryTextStyle()),
                          8.width,
                          Text(data.time.validate(), style: secondaryTextStyle()),
                        ],
                      )
                    ],
                  ).expand(),
                  8.width,
                  commonCacheImageWidget(data.img, 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(6)
                ],
              ),
            ],
          ),
        ).onTap(() {
          MPostDetailsScreen().launch(context);
        });
      },
    );
  }
}

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<MListModel> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8),
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          MListModel data = list[i];
          return GestureDetector(
            onTap: () {
              MPostDetailsScreen().launch(context);
            },
            child: Container(
              width: context.width() * 0.8,
              decoration: boxDecoration(bgColor: mGreyColor, radius: 8),
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(data.img!, height: 150, width: context.width(), fit: BoxFit.fitWidth).cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
                  8.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title.validate(), style: primaryTextStyle(color: white, size: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(data.subtitle.validate(), style: secondaryTextStyle(), maxLines: 2).visible(data.subtitle.validate().isNotEmpty),
                      8.height,
                      Text(data.authName.validate(), style: secondaryTextStyle()),
                      8.height,
                      Row(
                        children: [
                          Text(data.date.validate(), style: secondaryTextStyle()),
                          8.width,
                          Text(data.time.validate(), style: secondaryTextStyle()),
                        ],
                      )
                    ],
                  ).paddingOnly(left: 8, right: 8)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CommonListForStories extends StatelessWidget {
  final List<MStoriesModel>? list;

  const CommonListForStories({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => Divider(color: appDividerColor, height: 0.5),
      itemCount: list!.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 8, right: 8, bottom: 8, left: 16),
              width: context.width(),
              color: black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        list![index].title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(color: white),
                      ),
                      PopupMenuButton(
                        color: black,
                        icon: Icon(Icons.more_vert, color: grey),
                        padding: EdgeInsets.all(0),
                        onSelected: (dynamic val) {
                          if (val == 2) Share.share(list![index].title!);
                          if (val == 3) commonDeleteDialog(context);
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 1, child: Text("Edit", style: primaryTextStyle(color: Colors.white))),
                          PopupMenuItem(value: 2, child: Text("Share", style: primaryTextStyle(color: Colors.white))),
                          PopupMenuItem(value: 3, child: Text("Delete", style: primaryTextStyle(color: Colors.white)))
                        ],
                      ),
                    ],
                  ),
                  Text("${list![index].time} - 1 min read", style: primaryTextStyle(size: 14, color: grey))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CommonListDataForProfile extends StatefulWidget {
  final List<MStoriesModel>? list;

  const CommonListDataForProfile({Key? key, this.list}) : super(key: key);

  @override
  _CommonListDataForProfileState createState() => _CommonListDataForProfileState();
}

class _CommonListDataForProfileState extends State<CommonListDataForProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: widget.list!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: context.width(),
              color: black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.list![index].title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: boldTextStyle(color: white),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 0),
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    title: Text(widget.list![index].userName!, style: primaryTextStyle(size: 16, color: white)),
                    subtitle: Text("${widget.list![index].time} - 1 min read", style: primaryTextStyle(size: 14, color: grey)),
                    trailing: IconButton(
                        icon: Icon(widget.list![index].isFav.validate() ? Icons.bookmark : Icons.bookmark_border, color: white),
                        onPressed: () {
                          widget.list![index].isFav = !widget.list![index].isFav;
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white, height: 0.2)
          ],
        );
      },
    );
  }
}

Future commonDeleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(24),
          titlePadding: EdgeInsets.only(top: 20, left: 20, right: 20),
          backgroundColor: Color.fromRGBO(66, 66, 66, 1),
          title: Text(
            "Deleted stories are gone forever. Are you sure?",
            style: primaryTextStyle(color: white),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  finish(context);
                },
                child: Text("Cancel".toUpperCase(), style: boldTextStyle(size: 14, color: greenColor))),
            TextButton(
                onPressed: () {
                  finish(context);
                },
                child: Text("Delete".toUpperCase(), style: boldTextStyle(size: 14, color: greenColor))),
          ],
        );
      });
}

class MPeopleList extends StatefulWidget {
  const MPeopleList({Key? key, required this.list}) : super(key: key);

  final List<MPeopleModel> list;

  @override
  _MPeopleListState createState() => _MPeopleListState();
}

class _MPeopleListState extends State<MPeopleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) {
        MPeopleModel data = widget.list[i];
        return GestureDetector(
          onTap: () {
            MPostDetailsScreen().launch(context);
          },
          child: Container(
            color: black,
            child: Container(
              color: black,
              width: context.width(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonCacheImageWidget(data.img, 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title!, style: boldTextStyle(color: white), maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(data.subTitle!, style: secondaryTextStyle(size: 14), maxLines: 4, overflow: TextOverflow.ellipsis),
                    ],
                  ).expand(),
                  8.width,
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    decoration: boxDecoration(color: data.isFollow ? Colors.transparent : mLimeColor, bgColor: data.isFollow ? mLimeColor : Colors.transparent, radius: 5),
                    child: Text(data.isFollow ? 'Following' : 'Follow', style: primaryTextStyle(color: white)),
                  ).onTap(() {
                    data.isFollow = !data.isFollow;
                    setState(() {});
                  })
                ],
              ).paddingAll(16),
            ),
          ),
        );
      },
    );
  }
}

class MPublicationList extends StatefulWidget {
  const MPublicationList({Key? key, required this.list}) : super(key: key);

  final List<MPeopleModel> list;

  @override
  _MPublicationListState createState() => _MPublicationListState();
}

class _MPublicationListState extends State<MPublicationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) {
        MPeopleModel data = widget.list[i];
        return GestureDetector(
          onTap: () {
            MPostDetailsScreen().launch(context);
          },
          child: Container(
            color: black,
            width: context.width(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(data.img, 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title!, style: boldTextStyle(color: white), maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text(data.subTitle!, style: secondaryTextStyle(size: 14), maxLines: 4, overflow: TextOverflow.ellipsis),
                  ],
                ).expand(),
                8.width,
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  decoration: boxDecoration(color: data.isFollow ? Colors.transparent : mLimeColor, bgColor: data.isFollow ? mLimeColor : Colors.transparent, radius: 5),
                  child: Text(data.isFollow ? 'Following' : 'Follow', style: primaryTextStyle(color: white)),
                ).onTap(() {
                  data.isFollow = !data.isFollow;
                  setState(() {});
                })
              ],
            ).paddingAll(16),
          ),
        );
      },
    );
  }
}
