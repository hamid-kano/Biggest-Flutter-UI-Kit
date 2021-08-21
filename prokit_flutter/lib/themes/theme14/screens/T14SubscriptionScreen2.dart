import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14SubscriptionScreen2 extends StatefulWidget {
  @override
  _T14SubscriptionScreen2State createState() => _T14SubscriptionScreen2State();
}

class _T14SubscriptionScreen2State extends State<T14SubscriptionScreen2> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription', style: boldTextStyle(color: t14_colorBlue, size: 18)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: t14_SignInBgColor1,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.close, size: 18),
              onPressed: () {
                finish(context);
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [t14_SignInBgColor1, t14_SignInBgColor2]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_Subscription2_Title, style: boldTextStyle(size: 20, color: t14_colorBlue)),
                16.height,
                Text(t14_txt_Subscription2_SubTitle, style: secondaryTextStyle(size: 16, color: t14_colorBlue)),
                32.height,
                Row(
                  children: [
                    Text(t14_txt_price1, style: boldTextStyle(size: 80, color: t14_colorBlue)),
                    4.width,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(t14_txt_price2, style: boldTextStyle(size: 35, color: t14_colorBlue)),
                        Icon(Feather.dollar_sign, size: 26, color: t14_colorBlue),
                      ],
                    ),
                  ],
                ),
                24.height,
                UL(
                  symbolType: SymbolType.Bullet,
                  spacing: 8,
                  symbolColor: t14_colorWhite,
                  padding: 16,
                  children: [
                    Text(t14_txt_Subscription2_Sentiment, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                    Text(t14_txt_Subscription2_update, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                    Text(t14_txt_Subscription2_analyze, style: boldTextStyle(color: t14_colorBlue, size: 16)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                t14AppButton(
                  context,
                  btnText: t14_btn_bye_now,
                  bgColor: t14_colorWhite,
                  width: context.width(),
                  shape: 10.0,
                  txtColor: t14_colorBlue,
                ),
                24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(t14_txt_Privacy, style: secondaryTextStyle(size: 14)),
                    16.width,
                    Container(height: 12, width: 2, color: t14_GreyColor),
                    16.width,
                    Text(t14_txt_Terms, style: secondaryTextStyle(size: 14)),
                  ],
                ),
                8.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
