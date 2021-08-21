import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DALocationScreen extends StatefulWidget {
  @override
  DALocationScreenState createState() => DALocationScreenState();
}

class DALocationScreenState extends State<DALocationScreen> {
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
    return Scaffold(
      appBar: appBarWidget(
        'Change your location',
        center: true,
        titleTextStyle: boldTextStyle(size: 20),
        actions: [
          Icon(Icons.location_on_outlined).paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Stack(
              alignment: Alignment.center,
              children: [
                commonCachedNetworkImage(
                  'images/dating/mapImg.jpg',
                  fit: BoxFit.cover,
                  height: context.height() * 0.25,
                  width: context.width(),
                ).cornerRadiusWithClipRRect(20),
                Container(
                  height: context.height() * 0.25,
                  width: context.width(),
                  color: grey.withOpacity(0.6),
                ).cornerRadiusWithClipRRect(20),
                Text('Do you want us to use GPS?', style: boldTextStyle(color: white, size: 20), textAlign: TextAlign.center)
              ],
            ),
            16.height,
            AppButton(
              width: context.width(),
              color: primaryColor,
              onTap: () {
                //
              },
              text: 'Use my location',
              textStyle: boldTextStyle(color: white),
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
