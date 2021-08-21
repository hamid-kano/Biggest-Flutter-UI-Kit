import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme12/models/T12Models.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_corousel_widget.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';

import '../../../main.dart';
import 't12_constant.dart';

Widget toolBarTitle(var title, {textColor = t12_text_color_primary}) {
  return text(title, fontSize: textSizeNormal, fontFamily: fontBold, textColor: textColor);
}

Widget themeLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[Image.asset(t12_ic_logo, width: 30, height: 30), text("Werolla", fontSize: textSizeLarge, fontFamily: fontBold, textColor: appStore.textPrimaryColor).paddingLeft(spacing_standard_new)],
  );
}

Widget formField(context, hint,
    {isEnabled = true,
    isDummy = false,
    controller,
    isPasswordVisible = false,
    isPassword = false,
    keyboardType = TextInputType.text,
    FormFieldValidator<String>? validator,
    onSaved,
    textInputAction = TextInputAction.next,
    FocusNode? focusNode,
    FocusNode? nextFocus,
    IconData? suffixIcon,
    IconData? prefixIcon,
    maxLine = 1,
    suffixIconSelector}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword ? isPasswordVisible : false,
    cursorColor: t12_primary_color,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(spacing_standard), borderSide: BorderSide(color: Colors.transparent)),
      enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(spacing_standard), borderSide: BorderSide(color: Colors.transparent)),
      filled: true,
      fillColor: t12_edittext_background,
      hintText: hint,
      hintStyle: TextStyle(fontSize: textSizeMedium, color: t12_text_secondary),
      prefixIcon: Icon(
        prefixIcon,
        color: t12_text_secondary,
        size: 20,
      ),
      suffixIcon: isPassword
          ? GestureDetector(
              onTap: suffixIconSelector,
              child: new Icon(
                suffixIcon,
                color: t12_text_secondary,
                size: 20,
              ),
            )
          : Icon(
              suffixIcon,
              color: t12_text_secondary,
              size: 20,
            ),
    ),
    style: TextStyle(fontSize: textSizeNormal, color: isDummy ? Colors.transparent : t12_text_color_primary, fontFamily: fontRegular),
  );
}

// ignore: must_be_immutable
class T12SliderWidget extends StatelessWidget {
  List<T12Slider> mSliderList;
  var callBack;

  T12SliderWidget(this.mSliderList, this.callBack);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final Size cardSize = Size(width, width * (10 / 16));
    return T12CarouselSlider.builder(
      viewportFraction: 0.92,
      height: cardSize.height,
      enlargeCenterPage: true,
      onPageChanged: callBack,
      itemCount: mSliderList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: cardSize.height,
          padding: EdgeInsets.only(top: 16),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(gradient: LinearGradient(colors: t12_gradient_colors[index % t12_gradient_colors.length], begin: Alignment.topRight), borderRadius: BorderRadius.all(Radius.circular(spacing_standard))),
                width: MediaQuery.of(context).size.width,
                height: cardSize.height,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text("Shopping Card", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                      Image.asset(
                        "images/theme12/mastercard.png",
                        width: 40,
                        height: 40,
                      )
                    ],
                  ),
                  Expanded(child: text("**** **** **** 3960", textColor: Colors.white, fontFamily: fontBold, fontSize: textSizeNormal).paddingTop(spacing_standard)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text("CARD HOLDER", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                            text("JAMES DENNIS", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("EXPIRES", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                          text("10/22", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                        ],
                      ).paddingRight(spacing_standard_new),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("CVV", textColor: Colors.white.withOpacity(0.7), fontSize: textSizeMedium),
                          text("***", textColor: Colors.white, fontSize: textSizeMedium, fontFamily: fontMedium),
                        ],
                      )
                    ],
                  )
                ],
              ).paddingAll(spacing_standard_new)
            ],
          ),
        );
      },
    );
  }
}

Widget headingText(String content) {
  return text(content, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal);
}

Widget transactionWidget(T12Transactions transaction, var categoryWidth) {
  return Container(
    decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: spacing_standard),
    padding: EdgeInsets.all(spacing_standard),
    margin: EdgeInsets.only(bottom: spacing_standard),
    child: Row(
      children: <Widget>[
        Image.asset(
          transaction.img,
          width: categoryWidth * 0.75,
          height: categoryWidth * 0.75,
        ).cornerRadiusWithClipRRect(spacing_standard).paddingRight(spacing_standard),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(transaction.type, fontSize: textSizeMedium, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
              text(transaction.subType, fontSize: textSizeMedium, textColor: appStore.textSecondaryColor).paddingTop(spacing_control_half),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            text(transaction.transactionType == "credited" ? "+ \$" + transaction.amount.toString() : "- \$" + transaction.amount.toString(),
                fontSize: textSizeMedium, textColor: transaction.transactionType == "credited" ? t12_success : t12_error, fontFamily: fontBold),
            text(transaction.time, fontSize: textSizeMedium, textColor: appStore.textSecondaryColor).paddingTop(spacing_control)
          ],
        )
      ],
    ),
  );
}
