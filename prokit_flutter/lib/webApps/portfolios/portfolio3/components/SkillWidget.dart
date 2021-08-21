import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class SkillWidget extends StatefulWidget {
  static String tag = '/SkillWidget';

  @override
  SkillWidgetState createState() => SkillWidgetState();
}

class SkillWidgetState extends State<SkillWidget> {
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
      width: context.width(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.height(),
            width: context.width() * 0.8,
            child: Stack(
              children: [
                commonCachedNetworkImage(
                  p3SkillImg2,
                  height: context.height(),
                  width: context.width() * 0.8,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ).expand(flex: 5),
          Container(
            height: context.height(),
            width: context.width(),
            child: Stack(
              children: [
                commonCachedNetworkImage(
                  p3SkillImg1,
                  height: context.height(),
                  width: context.width(),
                  fit: BoxFit.cover,
                ),
                Container(
                  height: context.height(),
                  width: context.width(),
                  color: Colors.black.withOpacity(0.5),
                ),
                Center(
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    children: getSkillList().map((e) {
                      return Container(
                        width: context.width() * 0.2,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.phone_android_sharp, size: 30, color: Colors.white),
                            8.height,
                            Text(e.name!, style: boldTextStyle(size: 20, color: white)),
                            16.height,
                            Text(e.detail!, style: secondaryTextStyle(size: 15, color: white)),
                            16.height,
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ).expand(flex: 5),
        ],
      ),
    );
  }
}
