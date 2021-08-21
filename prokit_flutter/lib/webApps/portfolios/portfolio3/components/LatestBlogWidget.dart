import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';

import '../../../../main.dart';
import '../Colors.dart';

class LatestBlogWidget extends StatefulWidget {
  static String tag = '/LatestBlogWidget';

  @override
  LatestBlogWidgetState createState() => LatestBlogWidgetState();
}

class LatestBlogWidgetState extends State<LatestBlogWidget> {
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
    return Container(
      height: context.height(),
      width: context.width() * 0.85,
      color: appStore.isDarkModeOn ? appBackgroundColorDark : Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.height,
          Text(
            'Latest Blog',
            style: boldTextStyle(
              size: 45,
              decorationColor: portfolio3PrimaryColor,
              textDecorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.underline,
            ),
          ),
          24.height,
          Container(
            width: context.width() * 0.85,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getLatestBlogList().map((e) {
                  return Container(
                    margin: EdgeInsets.all(12),
                    width: context.width() * 0.25,
                    decoration: boxDecorationRoundedWithShadow(5, backgroundColor: appStore.isDarkModeOn ? appStore.appBarColor! : Colors.transparent),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCachedNetworkImage(e.img!, width: context.width() * 0.3, height: context.height() * 0.35, fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topLeft: 5, topRight: 5),
                        8.height,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.name!, style: boldTextStyle(size: 24), maxLines: 2),
                            8.height,
                            Text(e.type!, style: secondaryTextStyle(size: 16)),
                            8.height,
                            Text(e.detail!, style: primaryTextStyle(size: 16), maxLines: 3, textAlign: TextAlign.start),
                            16.height,
                            Text(
                              'Read More',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: portfolio3PrimaryColor,
                                decorationStyle: TextDecorationStyle.solid,
                                height: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appStore.textPrimaryColor,
                              ),
                            ).onTap(() {}),
                            24.height,
                          ],
                        ).paddingAll(16)
                      ],
                    ),
                  ).onTap(() {
                    //
                  });
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
