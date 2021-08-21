import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusReferEarn extends StatefulWidget {
  static String tag = '/QIBusReferEarn';

  @override
  QIBusReferEarnState createState() => QIBusReferEarnState();
}

class QIBusReferEarnState extends State<QIBusReferEarn> {
  Widget mImg(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
      imageUrl: qibus_ic_refer_and_earn,
      width: width * 0.4,
      height: width * 0.4,
    );
  }

  var mEarningLabel = text(QIBus_txtTotalEarning, fontFamily: fontMedium);
  var mEarningPriceLabel = text(QIBus__200, textColor: qIBus_colorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal);

  Widget mCode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text(QIBus_txtYourCode, textColor: qIBus_textChild),
        text(QIBus_lbl_2342340, textColor: qIBus_color_link_blue),
      ],
    );
  }

  var mGetLabel = text(QIBus_text_get_100_when_your_friend_complete_trip_with_us, fontSize: textSizeSmall, isLongText: true);

  Widget mLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text(
          QIBus_txt_your_link,
          textColor: qIBus_textChild,
          fontSize: textSizeSMedium,
        ),
        text(
          QIBus_text_link,
          textColor: qIBus_color_link_blue,
          isLongText: true,
          maxLine: 2,
          fontSize: textSizeSMedium,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_lbl_refer_and_earn,
              icon: qibus_gif_bell,
              isVisible: true,
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  children: <Widget>[
                    mImg(context),
                    mEarningLabel,
                    mEarningPriceLabel,
                    SizedBox(
                      height: spacing_standard,
                    ),
                    mCode(),
                    mGetLabel,
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          qibus_ic_facebook,
                          color: qIBus_color_facebook,
                          height: 22,
                          width: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          qibus_ic_google,
                          height: 22,
                          width: 22,
                          color: qIBus_colorPrimary,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          qibus_ic_twitter,
                          height: 22,
                          width: 22,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          qibus_ic_whatsapp,
                          height: 22,
                          width: 22,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mLink()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
