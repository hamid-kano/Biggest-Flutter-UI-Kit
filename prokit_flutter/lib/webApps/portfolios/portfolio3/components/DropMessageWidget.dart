import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Colors.dart';

class DropMessageWidget extends StatefulWidget {
  static String tag = '/DropMessageWidget';

  @override
  DropMessageWidgetState createState() => DropMessageWidgetState();
}

class DropMessageWidgetState extends State<DropMessageWidget> {
  var nameCont = TextEditingController();
  var emailCont = TextEditingController();
  var subjectCont = TextEditingController();
  var msgCont = TextEditingController();

  var emailFocus = FocusNode();
  var subjectFocus = FocusNode();
  var msgFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.height,
          Text(
            'Drop Me A Message',
            style: boldTextStyle(
              size: 45,
              decorationColor: portfolio3PrimaryColor,
              textDecorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.underline,
            ),
          ),
          24.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: context.width() * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameCont,
                      cursorColor: appStore.iconColor,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                        contentPadding: EdgeInsets.all(18),
                        hintStyle: secondaryTextStyle(),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: portfolio3PrimaryColor)),
                      ),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(emailFocus),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: emailCont,
                      focusNode: emailFocus,
                      cursorColor: appStore.iconColor,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.all(18),
                        hintStyle: secondaryTextStyle(),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: portfolio3PrimaryColor)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(subjectFocus),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: subjectCont,
                      focusNode: subjectFocus,
                      cursorColor: appStore.iconColor,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Subject',
                        contentPadding: EdgeInsets.all(18),
                        filled: true,
                        fillColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                        hintStyle: secondaryTextStyle(),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: portfolio3PrimaryColor)),
                      ),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(msgFocus),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: msgCont,
                      focusNode: msgFocus,
                      cursorColor: appStore.iconColor,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Your Message',
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: appStore.isDarkModeOn ? cardBackgroundBlackDark : portfolio3BackgroundColor,
                        contentPadding: EdgeInsets.all(18),
                        hintStyle: secondaryTextStyle(),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: portfolio3PrimaryColor)),
                      ),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      maxLines: 5,
                    ),
                    24.height,
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                        primary: portfolio3PrimaryColor,
                      ),
                      child: Text('SEND', style: boldTextStyle(color: Colors.white, size: 18)),
                    ),
                    24.height,
                  ],
                ),
              ).expand(flex: 6),
              24.width,
              Container(
                height: context.height() * 0.52,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Address:', style: boldTextStyle(size: 18)),
                    Text('Company Inc,', style: primaryTextStyle(size: 14)),
                    Text('Las vegas street 201,', style: primaryTextStyle(size: 14)),
                    Text('Las vegas street 201,', style: primaryTextStyle(size: 14)),
                    Text('United States of America.', style: primaryTextStyle(size: 14)),
                    24.height,
                    Text('Phone:', style: boldTextStyle(size: 18)),
                    Text('+11-22-55-66-05', style: primaryTextStyle(size: 14)).onTap(() {
                      launch('tel: +11-22-55-66-05');
                    }),
                    Text('+11-22-55-66-06,', style: primaryTextStyle(size: 14)).onTap(() {
                      launch('tel: +11-22-55-66-06');
                    }),
                    24.height,
                    Text('Email:', style: boldTextStyle(size: 18)),
                    Text('christopher@mail.com', style: primaryTextStyle(size: 14)).onTap(() {
                      launch('mailto:christopher@gmail.com');
                    }),
                    Text('United States of America.', style: primaryTextStyle(size: 14)),
                    24.height,
                  ],
                ),
              ).expand(flex: 3)
            ],
          )
        ],
      ),
    );
  }
}
