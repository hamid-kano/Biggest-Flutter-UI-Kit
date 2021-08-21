import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/modal/MModel.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MPostDetailsScreen.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MDataProvider.dart';

class MAudioArticlesScreen extends StatefulWidget {
  static String tag = '/MAudioArticlesScreen';
  final String? appBarTitle;

  const MAudioArticlesScreen({Key? key, this.appBarTitle}) : super(key: key);

  @override
  MAudioArticlesScreenState createState() => MAudioArticlesScreenState();
}

class MAudioArticlesScreenState extends State<MAudioArticlesScreen> {
  List<MListModel> horizontalList = getAudioArticlesHorizontalList();
  List<MListModel> verticalList = getAudioArticlesVerticalList();
  bool isFollow = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mGreyColor,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: isFollow
                ? MaterialButton(
                    minWidth: 100,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    onPressed: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    color: mLimeColor,
                    child: Text("Following"),
                  )
                : OutlinedButton(
                    child: Text("Follow", style: primaryTextStyle(color: white)),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                      side: BorderSide(color: mLimeColor),
                    ),
                    onPressed: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                  ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: white,
          onPressed: () {
            finish(context);
          },
        ),
        backgroundColor: black,
        title: Text(widget.appBarTitle!, style: boldTextStyle(size: 18, color: white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              color: mGreyColor,
              height: 250,
              child: ListView.builder(
                  itemCount: horizontalList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    MListModel data = horizontalList[index];
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          commonCacheImageWidget(data.img, 100, width: context.width() * 0.92, fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topLeft: 5, topRight: 5),
                          Container(
                            padding: EdgeInsets.all(12),
                            height: 118,
                            width: context.width() * 0.92,
                            color: black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(horizontalList[index].title!, style: boldTextStyle(color: white, size: 18)).expand(),
                                Text(horizontalList[index].authName!, style: primaryTextStyle(color: white, size: 14)),
                                Text(horizontalList[index].time!, style: boldTextStyle(color: grey, size: 12)),
                              ],
                            ),
                          ).cornerRadiusWithClipRRectOnly(bottomLeft: 5, bottomRight: 5),
                        ],
                      ),
                    );
                  }),
            ),
            AudioArticlesVerticalList(verticalList: verticalList)
          ],
        ),
      ),
    );
  }
}

class AudioArticlesVerticalList extends StatefulWidget {
  const AudioArticlesVerticalList({
    Key? key,
    required this.verticalList,
  }) : super(key: key);

  final List<MListModel> verticalList;

  @override
  _AudioArticlesVerticalListState createState() => _AudioArticlesVerticalListState();
}

class _AudioArticlesVerticalListState extends State<AudioArticlesVerticalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, index) => Divider(color: appDividerColor, height: 0.5),
      itemCount: widget.verticalList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        MListModel data = widget.verticalList[index];

        return GestureDetector(
          onTap: () {
            MPostDetailsScreen().launch(context);
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title!, maxLines: 2, overflow: TextOverflow.ellipsis, style: boldTextStyle(size: 16, color: white)),
                            10.height,
                            Text(data.subtitle!, overflow: TextOverflow.ellipsis, style: primaryTextStyle(size: 16, color: grey)),
                          ],
                        ).expand(),
                        10.width,
                        commonCacheImageWidget(data.img, 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(data.authName!, style: primaryTextStyle(size: 14, color: white)),
                      subtitle: Row(
                        children: [
                          Text("${data.date} - ${data.time} read", style: boldTextStyle(size: 12, color: grey)),
                          8.width,
                          Icon(Icons.star, size: 14, color: grey),
                          8.width,
                          Icon(AntDesign.sound, size: 14, color: grey),
                        ],
                      ),
                      trailing: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(data.isFav.validate() ? Icons.bookmark : Icons.bookmark_border, color: white),
                        onPressed: () {
                          data.isFav = !data.isFav.validate();

                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
