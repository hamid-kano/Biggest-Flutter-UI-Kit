import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLPillReviewComponent extends StatefulWidget {
  static String tag = '/MLPillReviewComponent';

  @override
  MLPillReviewComponentState createState() => MLPillReviewComponentState();
}

class MLPillReviewComponentState extends State<MLPillReviewComponent> {
  List<String?> person = <String?>['Mr. Tony Le', 'Ms. Gal Galot', 'Mr. Gauhy', 'Mr. Tony Le', 'Ms. Gal Galot', 'Mr. Gauhy'];

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reviews (234)', style: boldTextStyle(size: 24)),
          16.height,
          Column(
            children: <Widget>[
              for (int i = 0; i < person.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: radius(12),
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: mlColorCyan,
                            child: Image.asset(ml_ic_profile_picture!, fit: BoxFit.fill).paddingAll(2.0),
                          ),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(person[i].validate(), style: boldTextStyle(size: 14)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow, size: 14),
                                      Text("4.8", style: secondaryTextStyle(color: Colors.grey.shade500)),
                                    ],
                                  ),
                                  Text("23 Oct,2021", style: secondaryTextStyle(size: 16, color: mlColorLightGrey)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      8.height,
                      Text(mlPill_desc!, style: secondaryTextStyle(color: Colors.grey), textAlign: TextAlign.justify),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
