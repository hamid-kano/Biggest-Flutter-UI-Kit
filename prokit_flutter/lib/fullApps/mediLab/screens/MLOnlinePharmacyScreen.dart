import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLPharmacyCategoriesComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLOnlinePharmacyScreen extends StatefulWidget {
  static String tag = '/MLOnlinePharmacyScreen';

  @override
  MLOnlinePharmacyScreenState createState() => MLOnlinePharmacyScreenState();
}

class MLOnlinePharmacyScreenState extends State<MLOnlinePharmacyScreen> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  List<String> slides = <String>[
    ml_ic_pharmacySlide3!,
    ml_ic_pharmacySlide1!,
    ml_ic_pharmacySlide2!,
    ml_ic_pharmacySlide4!,
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: context.height() * 0.47,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: mlPrimaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          mlBackToPreviousWidget(context, white),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your Location', style: secondaryTextStyle(size: 12, color: white.withOpacity(0.5))),
                              4.height,
                              Text('35 St Martin\'s St West end', style: boldTextStyle(size: 14, color: white)),
                            ],
                          ),
                        ],
                      ).paddingAll(16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Online', style: boldTextStyle(size: 32, color: white)),
                              Text('Pharmacy', style: boldTextStyle(size: 32, color: white)),
                            ],
                          ).expand(),
                          Icon(Icons.search, color: white, size: 24),
                          8.width,
                          Icon(Icons.shopping_bag_outlined, color: white, size: 24),
                        ],
                      ).paddingAll(16.0),
                      8.height,
                      Container(
                        height: 180,
                        width: context.width(),
                        child: PageView(
                          controller: controller,
                          children: slides.map((e) {
                            return Image.asset(e.validate(), fit: BoxFit.fill).cornerRadiusWithClipRRect(12.0).paddingRight(16.0);
                          }).toList(),
                        ),
                      ),
                      16.height,
                      DotIndicator(pageController: controller, pages: slides, unselectedIndicatorColor: white.withOpacity(0.5)),
                      16.height,
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return MLPharmacyCategoriesComponent();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
