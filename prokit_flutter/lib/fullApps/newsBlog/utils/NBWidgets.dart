import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget nbAppTextFieldWidget(TextEditingController controller, String hintText, TextFieldType textFieldType, {FocusNode? focus, FocusNode? nextFocus}) {
  return AppTextField(
    controller: controller,
    textFieldType: textFieldType,
    textStyle: primaryTextStyle(size: 14),
    focus: focus,
    nextFocus: nextFocus,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      filled: true,
      fillColor: grey.withOpacity(0.1),
      hintText: hintText,
      hintStyle: secondaryTextStyle(),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
  );
}

Widget nbAppButtonWidget(BuildContext context, String text, Function onTap) {
  return AppButton(
    text: text,
    textStyle: boldTextStyle(color: white),
    color: NBPrimaryColor,
    onTap: onTap,
    width: context.width(),
  ).cornerRadiusWithClipRRect(20);
}

AppBar nbAppBarWidget(BuildContext context, {String? title}) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          finish(context);
        }),
    title: Text('$title', style: boldTextStyle(color: black, size: 20)),
    backgroundColor: white,
    centerTitle: true,
  );
}

InputDecoration nbInputDecoration(BuildContext context, {String? hintText, Widget? prefixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    filled: true,
    fillColor: grey.withOpacity(0.1),
    hintText: hintText,
    hintStyle: secondaryTextStyle(),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    prefixIcon: prefixIcon,
  );
}

Future<void> launchURL(String url, {bool forceWebView = false}) async {
  await launch(url, enableJavaScript: true, forceWebView: forceWebView).catchError((e) {
    throw '$url is not valid';
  });
}
