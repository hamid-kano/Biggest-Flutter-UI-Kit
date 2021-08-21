import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/models/Portfolio1SkillModel.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/DataGenerator.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class InfoWidget extends StatefulWidget {
  static String tag = '/InfoScreen';

  @override
  InfoWidgetState createState() => InfoWidgetState();
}

class InfoWidgetState extends State<InfoWidget> {
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
      child: Stack(
        children: [
          commonCachedNetworkImage(p1HireImg, width: context.width(), height: context.height(), fit: BoxFit.cover),
          Container(
            height: context.height(),
            width: context.width(),
            color: Colors.black12.withOpacity(0.35),
          ),
          Container(
            width: context.width() * 0.75,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Experiences', style: boldTextStyle(size: 28, color: white)).paddingLeft(20),
                      ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemBuilder: (_, index) {
                          Portfolio1ExperiencesModel data = getExperienceDetail()[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.height,
                              Container(
                                  padding: EdgeInsets.only(top: 4, bottom: 4, right: 12, left: 12),
                                  decoration: boxDecoration(color: Colors.green, bgColor: Colors.transparent),
                                  child: Text(data.date!, style: primaryTextStyle(color: white, size: 14))),
                              16.height,
                              Text(data.title!, style: primaryTextStyle(color: white)),
                              8.height,
                              Text(data.subTitle!, style: secondaryTextStyle()),
                              16.height,
                              Divider(height: 0.5, color: Colors.white),
                              16.height,
                            ],
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: getExperienceDetail().length,
                      ),
                    ],
                  ),
                ).expand(flex: 2),
                32.width,
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Education', style: boldTextStyle(size: 28, color: white)).paddingLeft(20),
                      ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemBuilder: (_, index) {
                          Portfolio1ExperiencesModel data = getEducationDetail()[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.height,
                              Container(
                                  padding: EdgeInsets.only(top: 4, bottom: 4, right: 12, left: 12),
                                  decoration: boxDecoration(color: Colors.green, bgColor: Colors.transparent),
                                  child: Text(data.date!, style: primaryTextStyle(color: white, size: 14))),
                              16.height,
                              Text(data.title!, style: primaryTextStyle(color: white)),
                              8.height,
                              Text(data.subTitle!, style: secondaryTextStyle()),
                              16.height,
                              Divider(height: 0.5, color: Colors.white),
                              16.height,
                            ],
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: getEducationDetail().length,
                      ),
                    ],
                  ),
                ).expand(flex: 2)
              ],
            ),
          ).center()
        ],
      ),
    );
  }
}
