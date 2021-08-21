import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio3/Colors.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';
import '../Colors.dart';

class IndeedWidget extends StatefulWidget {
  static String tag = '/IndeedWidget';

  @override
  IndeedWidgetState createState() => IndeedWidgetState();
}

class IndeedWidgetState extends State<IndeedWidget> {
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
      width: context.width(),
      color: appStore.isDarkModeOn ? appBackgroundColorDark : portfolio3BackgroundColor,
      child: Column(
        children: [
          Container(
            height: context.height() * 0.35,
            child: Stack(
              children: [
                commonCachedNetworkImage(
                  p2IndeedImg,
                  width: context.width(),
                  height: context.height() * 0.35,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: context.width(),
                  height: context.height() * 0.35,
                  color: black.withOpacity(0.7),
                ),
                Column(
                  children: [
                    24.height,
                    Text('I\'am available for freelance projects.', style: secondaryTextStyle(size: 18, color: white)),
                    16.height,
                    Text('Let\'s work together indeed!', style: boldTextStyle(size: 40, color: white)),
                    24.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                            primary: portfolio2PrimaryColor,
                          ),
                          child: Text('Get Quotes', style: boldTextStyle(color: Colors.white, size: 18)),
                        ),
                        16.width,
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                            primary: Colors.white,
                          ),
                          child: Text('Hire Me', style: boldTextStyle(color: black, size: 18)),
                        ),
                      ],
                    ),
                    24.height,
                  ],
                ),
              ],
            ),
          ),
          //20.height,
          Container(
            width: context.width(),
            color: black,
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Center(
              child: Container(
                width: context.width() * 0.7,
                child: Row(
                  children: [
                    Text('© 2020 My Website. All rights reserved | Designed by Iqonic Design', style: primaryTextStyle(size: 14, color: white), textAlign: TextAlign.center).expand(),
                    8.width,
                    Icon(Entypo.facebook_with_circle, size: 28, color: Colors.white).onTap(() {
                      launch('https://www.facebook.com');
                    }),
                    8.width,
                    Icon(Entypo.twitter_with_circle, size: 28, color: Colors.white).onTap(() {
                      launch('https://www.twitter.com');
                    }),
                    8.width,
                    Icon(Entypo.instagram_with_circle, size: 28, color: Colors.white).onTap(() {
                      launch('https://www.instagram.com');
                    }),
                    8.width,
                    Icon(Entypo.linkedin_with_circle, size: 28, color: Colors.white).onTap(() {
                      launch('https://www.linkedin.com');
                    }),
                    8.width,
                    Icon(FontAwesome.youtube, size: 28, color: Colors.white).onTap(() {
                      launch('https://www.youtube.com');
                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
