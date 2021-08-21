import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/model/NBModel.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBDataProviders.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBBookmarkScreen extends StatefulWidget {
  static String tag = '/NBBookmarkScreen';

  @override
  NBBookmarkScreenState createState() => NBBookmarkScreenState();
}

class NBBookmarkScreenState extends State<NBBookmarkScreen> {
  List<String> dropDownItems = ['Most Recent', 'Ascending', 'Descending'];
  List<NBNewsDetailsModel> newsList = nbGetNewsDetails();
  List<NBNewsDetailsModel> bookmarkNewsList = [];

  String? dropDownValue = 'Most Recent';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    newsList.forEach((element) {
      if (element.isBookmark) {
        bookmarkNewsList.add(element);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nbAppBarWidget(context, title: 'Bookmark'),
      body: bookmarkNewsList.length != 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sort by', style: primaryTextStyle()),
                      DropdownButton(
                        value: dropDownValue,
                        items: List.generate(dropDownItems.length, (index) {
                          return DropdownMenuItem(
                            child: Text('${dropDownItems[index]}', style: boldTextStyle()),
                            value: dropDownItems[index],
                          );
                        }),
                        onChanged: (dynamic value) {
                          setState(() {
                            dropDownValue = value;
                            toast(dropDownValue);
                          });
                        },
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: bookmarkNewsList.length,
                    itemBuilder: (context, index) {
                      NBNewsDetailsModel mData = bookmarkNewsList[index];
                      return Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('${mData.image}', height: 100, fit: BoxFit.fill).cornerRadiusWithClipRRect(16).expand(flex: 1),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${mData.categoryName}', style: boldTextStyle(color: NBPrimaryColor)),
                                Text('${mData.title}', style: boldTextStyle(), softWrap: true, maxLines: 3),
                                8.height,
                                Text('${mData.date}', style: secondaryTextStyle()),
                              ],
                            ).expand(flex: 2),
                            PopupMenuButton(
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    height: 10,
                                    child: Text('Remove', style: boldTextStyle()),
                                    value: 'Remove',
                                  ),
                                ];
                              },
                              onSelected: (dynamic value) {
                                setState(() {
                                  if (value == 'Remove') {
                                    mData.isBookmark = !mData.isBookmark;
                                    bookmarkNewsList.remove(mData);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ).onTap(() {
                        NBNewsDetailsScreen(newsDetails: mData).launch(context);
                      });
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                ],
              ).paddingOnly(left: 16, right: 16),
            )
          : Center(
              child: Text('No Data Found', style: boldTextStyle()),
            ),
    );
  }
}
