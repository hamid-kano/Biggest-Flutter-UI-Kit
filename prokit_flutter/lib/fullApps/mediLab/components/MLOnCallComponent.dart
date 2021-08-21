import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLOnCallComponent extends StatefulWidget {
  static String tag = '/MLOnCallComponent';

  @override
  MLOnCallComponentState createState() => MLOnCallComponentState();
}

class MLOnCallComponentState extends State<MLOnCallComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void dispose() {
    super.dispose();
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
          Container(
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(0),
              backgroundColor: Colors.grey,
              decorationImage: DecorationImage(image: AssetImage(ml_ic_video_consult!), fit: BoxFit.cover),
            ),
          ),
          Positioned(
              bottom: 48,
              right: 16,
              child: Container(
                decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorLightGrey, borderRadius: radius(12)),
                width: context.width() / 3,
                height: context.height() / 4,
                child: Image.asset(ml_ic_profile_picture!).cornerRadiusWithClipRRect(24.0),
              )),
          Positioned(
            bottom: 48,
            left: 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Doctor', style: primaryTextStyle(color: blackColor)),
                4.height,
                Text('Stephen Chow', style: boldTextStyle(size: 24, color: blackColor)),
                8.height,
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.black12, borderRadius: radius(12)),
                  child: Row(
                    children: [
                      Icon(Icons.fiber_smart_record_rounded, color: mlColorRed, size: 12),
                      4.width,
                      Text('01:20:12', style: boldTextStyle(color: whiteColor)),
                    ],
                  ).paddingOnly(right: 8.0, left: 8.0),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        notchMargin: 4.0,
        shape: CircularNotchedRectangle(),
        child: Container(
          alignment: Alignment.centerLeft,
          height: context.height() / 10.0,
          child: MaterialButton(
            child: Container(
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: Colors.transparent,
                borderRadius: radius(30),
                border: Border.all(color: mlColorLightGrey100),
              ),
              child: Icon(Icons.chat_outlined, color: black, size: 24).paddingAll(10.0),
            ),
            onPressed: () {
              setState(() {});
            },
          ).paddingLeft(context.width() * 0.20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: Image.asset(ml_ic_end_call!),
        onPressed: () {
          setState(() {});
          finish(context);
          finish(context);
        },
      ),
    );
  }
}
