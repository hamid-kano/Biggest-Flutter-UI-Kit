import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class TestimonialWidget extends StatefulWidget {
  static String tag = '/TestimonialWidget';

  @override
  TestimonialWidgetState createState() => TestimonialWidgetState();
}

class TestimonialWidgetState extends State<TestimonialWidget> {
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
      height: 300,
      margin: EdgeInsets.only(top: 32, bottom: 32),
      child: Stack(
        children: [
          commonCachedNetworkImage(
            p2GalleryImg6,
            fit: BoxFit.cover,
            height: 300,
            width: context.width(),
          ),
          Container(width: context.width(), height: 300, color: Colors.black.withOpacity(0.75)),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '" There are many variations of passages of Lorem Ipsum available, randomised words which don\'t look even slightly believable. Lorem ipsum dolor sit amet '
                  'consectetur adipisicing elit. Laborum sed dignissimos explicabo facilis incidunt maiores eos "',
                  style: boldTextStyle(size: 28, color: Colors.white),
                  maxLines: 4,
                ).expand(flex: 1),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonCachedNetworkImage(
                      p2User,
                      height: 120,
                    ).cornerRadiusWithClipRRect(60),
                    8.height,
                    Text('christopher robin', style: boldTextStyle(size: 20, color: Colors.white)),
                    4.height,
                    Text('- UI/UX Designer', style: secondaryTextStyle(size: 20, color: Colors.white)),
                  ],
                ).expand(flex: 1),
              ],
            ).withWidth(context.width() * 0.8),
          ),
        ],
      ),
    );
  }
}
