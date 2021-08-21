import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class AvailableProjectWidget extends StatefulWidget {
  static String tag = '/AvailableProjectWidget';

  @override
  AvailableProjectWidgetState createState() => AvailableProjectWidgetState();
}

class AvailableProjectWidgetState extends State<AvailableProjectWidget> {
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
      width: context.width() * 0.7,
      margin: EdgeInsets.only(bottom: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.height,
                Text('I\'m Available For Freelance Projects.', style: boldTextStyle(size: 35)),
                8.height,
                Text('Imagination is more important than knowledge', style: secondaryTextStyle(size: 24)),
                8.height,
                Text(
                  'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempore minima doloribus provident,'
                  'quia, ipsam totam veniam iste ea temporibus non consequatur tenetur? Velit officiis laborum molestias'
                  'ratione impedit, totam, praesentium a nulla fuga aliquam repellendus facilis consequuntur corrupti cum delectus, '
                  'quia maiores accusamus animi obcaecati vel ipsum.',
                  style: primaryTextStyle(size: 16, color: Colors.grey.withOpacity(0.5)),
                  maxLines: 6,
                ).withWidth(context.width() * 0.3),
              ],
            ).withWidth(context.width() * 0.65),
          ).expand(flex: 3),
          16.width,
          Container(
            child: Column(
              children: [
                16.height,
                Container(
                  width: context.width(),
                  height: 180,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      commonCachedNetworkImage(
                        p2ProjectImg1,
                        width: context.width(),
                        height: 200,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: boxDecorationWithRoundedCorners(backgroundColor: black, borderRadius: BorderRadius.circular(10)),
                          child: Text('A Collection of Creative Website Design', style: primaryTextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ).cornerRadiusWithClipRRect(10),
                ),
                16.height,
                Container(
                  width: context.width(),
                  height: 180,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      commonCachedNetworkImage(
                        p2ProjectImg1,
                        width: context.width(),
                        height: 200,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: boxDecorationWithRoundedCorners(backgroundColor: black, borderRadius: BorderRadius.circular(10)),
                          child: Text('Personalized Portfolio Work', style: primaryTextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ).cornerRadiusWithClipRRect(10),
                ),
              ],
            ),
          ).expand(flex: 3),
        ],
      ).withWidth(context.width() * 0.5),
    );
  }
}
