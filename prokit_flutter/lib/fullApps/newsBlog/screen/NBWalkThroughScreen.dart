import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/screen/NBSignInScreen.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBImages.dart';

class NBWalkThroughScreen extends StatefulWidget {
  static String tag = '/NBWalkThroughScreen';

  @override
  NBWalkThroughScreenState createState() => NBWalkThroughScreenState();
}

class NBWalkThroughScreenState extends State<NBWalkThroughScreen> {
  List<String> mPages = <String>[NBWalkThroughImage1, NBWalkThroughImage2, NBWalkThroughImage1];

  int position = 0;

  PageController? pageController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController = PageController(initialPage: position, viewportFraction: 0.75);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              70.height,
              Container(
                height: context.height() * 0.5,
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: mPages.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: 500.milliseconds,
                      height: index == position ? context.height() * 0.5 : context.height() * 0.45,
                      margin: EdgeInsets.only(left: 16, right: 8),
                      child: Image.asset(
                        mPages[index],
                        fit: BoxFit.cover,
                        width: context.width(),
                      ).cornerRadiusWithClipRRect(16),
                    );
                  },
                  onPageChanged: (value) {
                    setState(() {
                      position = value;
                    });
                  },
                ),
              ),
              20.height,
              DotIndicator(pageController: pageController!, pages: mPages, indicatorColor: NBPrimaryColor),
              16.height,
              Text('Welcome to News Blog', style: boldTextStyle(size: 20)).paddingOnly(left: 16, right: 16),
              16.height,
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: secondaryTextStyle(), textAlign: TextAlign.center).paddingOnly(left: 16, right: 16),
              16.height,
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  width: (context.width() - (3 * 16)) * 0.5,
                  height: 60,
                  text: 'Skip',
                  textStyle: boldTextStyle(),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  onTap: () {
                    NBSignInScreen().launch(context);
                  },
                  color: grey.withOpacity(0.1),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                ),
                16.width,
                AppButton(
                  width: (context.width() - (3 * 16)) * 0.5,
                  text: position < 2 ? 'Next' : 'Finish',
                  height: 60,
                  elevation: 0,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: NBPrimaryColor,
                  textStyle: boldTextStyle(color: white),
                  onTap: () {
                    setState(() {
                      if (position < 2) {
                        pageController!.nextPage(duration: Duration(microseconds: 300), curve: Curves.linear);
                      } else if (position == 2) {
                        NBSignInScreen().launch(context);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }
}
