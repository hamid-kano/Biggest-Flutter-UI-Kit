import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/portfolio2/Colors.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

import '../../../../main.dart';

class AboutUsScreen extends StatefulWidget {
  static String tag = '/AboutUsScreen';

  @override
  AboutUsScreenState createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
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
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonCachedNetworkImage(
            p2AboutImg,
            height: context.height() * 0.4,
            width: context.width() * 0.2,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(16),
          40.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'I\'m a Passionate designer & developer who loves simplicity in things and crafts beautiful user interfaces with love.',
                style: boldTextStyle(size: 24, letterSpacing: 1.2),
              ),
              16.height,
              Text(
                'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Amet non porro laboriosam rerum fugiat quod ullam earum dignissimos corporis, nemo provident '
                'nostrum, nihil culpa. Et corrupti sit hic amet, animi unde cumque consequuntur omnis ad nihil optio id eum qui, impedit deleniti? Veniam eum '
                'aspernatur incidunt? Doloremque, cum? Repellendus consectetur, cupiditate tenetur provident neque, quas, totam eveniet nisi eius veritatis ea maiores ducimus a '
                'reprehenderit minima magnam dicta! Aliquam libero voluptatum facilis dolorum architecto? Doloribus fuga voluptate voluptatem corporis rem! Culpa nam et accusamus beatae!',
                style: boldTextStyle(letterSpacing: 1.3, size: 12, color: appStore.textSecondaryColor),
              ),
              16.height,
              MaterialButton(
                onPressed: () {},
                color: portfolio2PrimaryColor,
                padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                child: Text('About me', style: primaryTextStyle(color: Colors.white)),
              )
            ],
          ).expand(flex: 2),
        ],
      ).withWidth(context.width() * 0.7),
    );
  }
}
