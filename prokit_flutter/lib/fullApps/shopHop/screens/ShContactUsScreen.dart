import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/screens/ShEmailScreen.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class ShContactUsScreen extends StatefulWidget {
  static String tag = '/ShContactUsScreen';

  @override
  ShContactUsScreenState createState() => ShContactUsScreenState();
}

class ShContactUsScreenState extends State<ShContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_lbl_contact_us, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_colorPrimary),
        actions: <Widget>[cartIcon(context, 3)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                launch("tel:$sh_contact_phone");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(sh_lbl_call_request, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: sh_textColorPrimary,
                      )
                    ],
                  ),
                  text(sh_contact_phone, fontSize: textSizeSMedium),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            SizedBox(height: spacing_standard_new),
            InkWell(
              onTap: () {
                ShEmailScreen().launch(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(sh_lbl_email, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: sh_textColorPrimary,
                      )
                    ],
                  ),
                  text("Response within 24 business hours", fontSize: textSizeSMedium),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
