import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusImages.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';

class QIBusWallet extends StatefulWidget {
  static String tag = '/QIBusWallet';

  @override
  QIBusWalletState createState() => QIBusWalletState();
}

class QIBusWalletState extends State<QIBusWallet> {
  var mLabel1 = text(QIBus_lbl_your_wallet_in_balance);
  var mPriceLabel = RichText(
    text: TextSpan(
      children: [
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(
              Icons.account_balance_wallet,
              color: qIBus_colorPrimary,
              size: 16,
            ),
          ),
        ),
        TextSpan(text: QIBus__200, style: TextStyle(fontSize: textSizeLarge, color: qIBus_colorPrimary)),
      ],
    ),
  );
  var mLabel3 = text(QIBus_lbl_wallet, fontFamily: fontMedium);

  Widget mSocialIcon(var icon, BuildContext context, {var color}) {
    var w = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(right: spacing_standard_new),
        child: SvgPicture.asset(
          icon,
          height: w * 0.1,
          color: color,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: qIBus_app_background,
        body: Column(
          children: <Widget>[
            TopBar(
              QIBus_lbl__wallet,
              icon: qibus_gif_bell,
              isVisible: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: qibus_ic_gr_wallet,
                      width: w * 0.4,
                      height: w * 0.4,
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mLabel1,
                    SizedBox(
                      height: spacing_standard,
                    ),
                    mPriceLabel,
                    SizedBox(
                      height: spacing_standard,
                    ),
                    mLabel3,
                    SizedBox(
                      height: spacing_large,
                    ),
                    view(),
                    SizedBox(
                      height: spacing_large,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        mSocialIcon(qibus_ic_whatsapp, context),
                        mSocialIcon(qibus_ic_fb, context),
                        mSocialIcon(qibus_ic_google_fill, context, color: qIBus_color_google),
                        mSocialIcon(qibus_ic_twitter, context),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
