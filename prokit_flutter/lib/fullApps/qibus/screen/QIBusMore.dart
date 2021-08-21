import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

import 'QIBusCards.dart';
import 'QIBusEditProfile.dart';
import 'QIBusHelp.dart';
import 'QIBusReferEarn.dart';
import 'QIBusSetting.dart';
import 'QIBusWallet.dart';

class QIBusMore extends StatefulWidget {
  @override
  QIBusMoreState createState() => QIBusMoreState();
}

class QIBusMoreState extends State<QIBusMore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              "More",
              icon: qibus_gif_bell,
              isVisible: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    mOption(qibus_ic_user, QIBus_lbl_edit_profile, onTap: () {
                      QIBusEditProfile().launch(context);
                    }),
                    mOption(qibus_ic_wallet, QIBus_lbl__wallet, onTap: () {
                      QIBusWallet().launch(context);
                    }),
                    mOption(qibus_ic_card_line, QIBus_lbl_cards, onTap: () {
                      QIBusCards().launch(context);
                    }),
                    mOption(qibus_ic_refer, QIBus_lbl_refer_and_earn, onTap: () {
                      QIBusReferEarn().launch(context);
                    }),
                    mOption(qibus_ic_setting, QIBus_text_settings, onTap: () {
                      QIBusSetting().launch(context);
                    }),
                    mOption(qibus_ic_help, QIBus_lbl_help, onTap: () {
                      QIBusHelp().launch(context);
                    }),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => LogoutDialog(),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
                        decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_white, showShadow: true),
                        padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, spacing_standard_new, spacing_standard_new),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: spacing_standard),
                                    child: SvgPicture.asset(
                                      qibus_ic_logout,
                                      color: qIBus_textHeader,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                                TextSpan(text: QIBus_text_logout, style: TextStyle(fontSize: textSizeMedium, color: qIBus_textHeader)),
                              ],
                            )),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: qIBus_icon_color,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: qibus_ic_buslogo,
                      width: width * 0.2,
                    ),
                    text(QIBus_text_version_1_0, textColor: qIBus_textChild)
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget mOption(var icon, var lbl, {required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
        decoration: boxDecoration(radius: spacing_middle, bgColor: qIBus_white, showShadow: true),
        padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, spacing_standard_new, spacing_standard_new),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
                text: TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(right: spacing_standard),
                    child: SvgPicture.asset(
                      icon,
                      color: qIBus_textHeader,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
                TextSpan(text: lbl, style: TextStyle(fontFamily: fontMedium, fontSize: textSizeMedium, color: qIBus_textHeader)),
              ],
            )),
            Icon(
              Icons.keyboard_arrow_right,
              color: qIBus_icon_color,
            )
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing_middle),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(spacing_standard_new),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(spacing_middle),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          text(QIBus_text_confirmation, maxLine: 2, isLongText: true, fontFamily: fontMedium, fontSize: textSizeNormal),
          text(
            QIBus_msg_logout,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              text(QIBus_text_no, textColor: qIBus_blue),
              SizedBox(
                width: spacing_standard_new,
              ),
              text(QIBus_text_yes, textColor: qIBus_blue)
            ],
          )
        ],
      ));
}
