import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDashboard.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizImages.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizNotification extends StatefulWidget {
  static String tag = '/QuizNotification';

  @override
  _QuizNotificationState createState() => _QuizNotificationState();
}

class _QuizNotificationState extends State<QuizNotification> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      backgroundColor: quiz_app_background,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: quiz_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        backgroundColor: quiz_app_background,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: quiz_app_background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: quiz_ic_notification,
                  height: 200,
                  width: 200,
                ).cornerRadiusWithClipRRect(100).center(),
                text(quiz_lbl_notifications, textColor: quiz_textColorPrimary, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(top: 24),
                text(quiz_info_notification, textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium, isLongText: true, isCentered: true),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      QuizDashboard().launch(context);
                    });
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width / 3.0,
                      decoration: boxDecoration(bgColor: quiz_colorPrimary, radius: 16),
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          text("Allow", textColor: quiz_white, fontFamily: fontMedium, isCentered: true, textAllCaps: false).paddingOnly(left: 8),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: quiz_colorPrimaryDark),
                              width: 35,
                              height: 35,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: quiz_white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ).paddingOnly(top: 24),
                SizedBox(
                  height: 20,
                ),
                text(quiz_lbl_skip, textColor: quiz_textColorSecondary, fontSize: textSizeNormal, fontFamily: fontMedium, isCentered: true).onTap(() {
                  setState(() {
                    QuizDashboard().launch(context);
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
