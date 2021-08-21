import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';

import '../../../main.dart';

class T12WalkThrough extends StatefulWidget {
  static String tag = '/T12WalkThrough';

  @override
  T12WalkThroughState createState() => T12WalkThroughState();
}

class T12WalkThroughState extends State<T12WalkThrough> {
  final PageController controller = new PageController();
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(children: [
              T12WalkThroughWidget(
                title: "Add & Manage Cards",
                subTitle: "You can add and manage all bank accounts & credit or debit cards",
                image: t12_card,
                color: t12_cat2,
              ),
              T12WalkThroughWidget(
                title: "Transfer & Receive Money",
                subTitle: "Easily transfer your money & receive your earnings from others",
                image: t12_money_1,
                color: t12_cat3,
              ),
              T12WalkThroughWidget(
                title: "Pay Bills & Payments",
                subTitle: "Pay your all bills & make payments all over world",
                image: t12_money,
                color: t12_cat4,
              ),
              T12WalkThroughWidget(
                title: "Manage Your Wallet",
                subTitle: "Manage your all earning, expenses & every penny anyhere, anytime",
                image: t12_wallet_2,
                color: t12_primary_color,
              )
            ], controller: controller, onPageChanged: _onPageChanged),
          ),
          Column(
            children: <Widget>[
              DotsIndicator(
                dotsCount: 4,
                position: currentPage,
                decorator: DotsDecorator(color: t12_text_secondary.withOpacity(0.15), activeColor: t12_primary_color, activeSize: Size.square(spacing_middle), spacing: EdgeInsets.all(3)),
              ).paddingBottom(height * 0.09),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
                  child: text(currentPage == 3 ? "Get Started" : "Continue", textColor: Colors.white, fontFamily: fontMedium),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_standard)),
                  color: t12_primary_color,
                  onPressed: () => {
                    if (currentPage == 3)
                      {Navigator.pop(context)}
                    else
                      {
                        setState(() {
                          currentPage++;
                          controller.animateToPage(currentPage, duration: Duration(milliseconds: 500), curve: Curves.ease);
                        })
                      }
                  },
                ).paddingOnly(left: spacing_large, right: spacing_large),
              ),
              text(currentPage != 3 ? "Skip Now" : "", textColor: appStore.textSecondaryColor, fontSize: textSizeMedium).paddingAll(spacing_standard_new).onTap(() {
                finish(context);
              })
            ],
          )
        ],
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }
}

// ignore: must_be_immutable
class T12WalkThroughWidget extends StatelessWidget {
  var title;
  var image;
  var subTitle;
  Color? color;

  T12WalkThroughWidget({this.title, this.image, this.subTitle, this.color});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: height * 0.3,
        ),
        Expanded(
          child: Image.asset(
            image,
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
        text(title, fontSize: textSizeLarge, fontFamily: fontBold, textColor: appStore.textPrimaryColor).paddingOnly(left: spacing_large, right: spacing_large, top: height * 0.2),
        text(subTitle, maxLine: 2, fontSize: textSizeMedium, isCentered: true, textColor: appStore.textSecondaryColor).paddingOnly(left: spacing_large, right: spacing_large, top: spacing_standard)
      ],
    ).paddingBottom(spacing_standard_new);
  }
}
