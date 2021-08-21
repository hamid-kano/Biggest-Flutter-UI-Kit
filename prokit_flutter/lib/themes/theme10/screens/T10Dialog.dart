import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Images.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/themes/theme10/utils/T10Widget.dart' as t;

import '../../../main.dart';

class T10Dialog extends StatefulWidget {
  static String tag = '/T10Dialog';

  @override
  T10DialogState createState() => T10DialogState();
}

class T10DialogState extends State<T10Dialog> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    Future.delayed(const Duration(milliseconds: 500), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: appStore.iconColor,
                    ),
                    color: appStore.iconColor,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                  Center(
                    child: text(theme10_search, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
      color: appStore.scaffoldBackground,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10),
      boxShadow: defaultBoxShadow(),
    ),
    width: MediaQuery.of(context).size.width,
    //height: MediaQuery.of(context).size.height * 0.8,
    padding: EdgeInsets.all(spacing_standard_new),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          SvgPicture.asset(t10_ic_otp, width: width * 0.25, height: width * 0.4, fit: BoxFit.fill),
          SizedBox(height: spacing_standard_new),
          Text(theme10_lbl_we_have_sent_you_mail_with_verification_code_to, style: secondaryTextStyle(), textAlign: TextAlign.center),
          SizedBox(height: spacing_standard_new),
          TextFormField(
            cursorColor: t10_colorPrimary,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
              hintText: theme10_lbl_resend_code,
              hintStyle: secondaryTextStyle(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: appStore.textSecondaryColor!, width: 0.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: appStore.textSecondaryColor!, width: 0.0),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(
              fontSize: textSizeMedium,
              color: appStore.textPrimaryColor,
            ),
          ),
          SizedBox(height: spacing_standard_new),
          t.AppButtons(
            onPressed: () {},
            textContent: theme10_lbl_submit_now,
          ),
          SizedBox(height: spacing_large),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              text(theme10_lbl_did_not_receive, textColor: t10_textColorSecondary, fontFamily: fontMedium, fontSize: textSizeSMedium),
              SizedBox(width: spacing_control),
              text(theme10_lbl_resend_code, fontFamily: fontMedium, textAllCaps: true, fontSize: textSizeSMedium)
            ],
          ),
          SizedBox(height: spacing_standard),
          text(theme10_lbl_sms_send, isLongText: true, fontSize: textSizeSMedium),
        ],
      ),
    ),
  );
}
