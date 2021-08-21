import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../../../../main.dart';
import '../Colors.dart';

class ServicesWidget extends StatefulWidget {
  static String tag = '/ServicesWidget';

  @override
  ServicesWidgetState createState() => ServicesWidgetState();
}

class ServicesWidgetState extends State<ServicesWidget> {
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
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: [
          Container(
            height: context.height() * 0.35,
            alignment: Alignment.center,
            child: Stack(
              children: [
                commonCachedNetworkImage(
                  p3ServiceImg,
                  height: context.height() * 0.35,
                  width: context.width(),
                  fit: BoxFit.cover,
                ),
                Container(
                  width: context.width(),
                  color: Colors.black.withOpacity(0.5),
                  child: Container(
                    width: context.width() * 0.85,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 16, bottom: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top: 24, bottom: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: getServicesList().map((e) {
                          return Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.all(16),
                            width: context.width() * 0.18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title!, style: boldTextStyle(color: Colors.white, size: 24), maxLines: 2),
                                8.height,
                                Text(
                                  e.subTitle!,
                                  style: secondaryTextStyle(color: Colors.white.withOpacity(0.7), size: 16),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ).onTap(() {});
                        }).toList(),
                      ),
                    ),
                  ).center(),
                )
              ],
            ),
          ),
          Container(
            width: context.width() * 0.85,
            color: appStore.scaffoldBackground,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.height,
                Text(
                  'My Services',
                  style: boldTextStyle(
                    size: 45,
                    decorationColor: portfolio3PrimaryColor,
                    textDecorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
                  ),
                ),
                24.height,
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: getServiceList2().map((e) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(16),
                          width: context.width() * 0.25,
                          decoration: boxDecorationRoundedWithShadow(10, backgroundColor: appStore.appBarColor!),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.height,
                              Container(
                                width: 80,
                                height: 80,
                                color: portfolio3PrimaryColor.withOpacity(0.2),
                                child: Icon(MaterialCommunityIcons.laptop_mac, size: 30, color: portfolio3PrimaryColor),
                              ).cornerRadiusWithClipRRect(40),
                              16.height,
                              Text(e.name!, style: boldTextStyle(size: 24)),
                              16.height,
                              Text(e.detail!, style: secondaryTextStyle(size: 16)),
                              32.height,
                            ],
                          ),
                        ).onTap(() {});
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          32.height,
        ],
      ),
    );
  }
}
