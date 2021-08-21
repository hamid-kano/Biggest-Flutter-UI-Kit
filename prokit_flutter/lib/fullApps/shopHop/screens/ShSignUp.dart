import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShImages.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';

class ShSignUp extends StatefulWidget {
  static String tag = '/ShSignUp';

  @override
  ShSignUpState createState() => ShSignUpState();
}

class ShSignUpState extends State<ShSignUp> {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  var firstNameCont = TextEditingController();
  var lastNameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: height - (width + width * 0.05),
                child: CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: ic_app_background,
                  height: width + width * 0.05,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      ic_app_icon,
                      width: width * 0.22,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        text("Shop", textColor: sh_textColorPrimary, fontSize: spacing_xlarge, fontFamily: fontBold),
                        text("hop", textColor: sh_colorPrimary, fontSize: spacing_xlarge, fontFamily: fontBold),
                      ],
                    ),
                    SizedBox(
                      height: spacing_xlarge,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              controller: firstNameCont,
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: sh_editText_background,
                                  focusColor: sh_editText_background_active,
                                  hintText: sh_hint_first_name,
                                  hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                            ),
                          ),
                          SizedBox(
                            width: spacing_standard_new,
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              controller: lastNameCont,
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: sh_editText_background,
                                  focusColor: sh_editText_background_active,
                                  hintText: sh_hint_last_name,
                                  hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      controller: emailCont,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: sh_editText_background,
                          focusColor: sh_editText_background_active,
                          hintText: sh_hint_Email,
                          hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: true,
                      style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      controller: passwordCont,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: sh_editText_background,
                          focusColor: sh_editText_background_active,
                          hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          hintText: sh_hint_password,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: true,
                      style: TextStyle(color: sh_textColorPrimary, fontFamily: fontRegular, fontSize: textSizeMedium),
                      controller: confirmPasswordCont,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: sh_editText_background,
                          focusColor: sh_editText_background_active,
                          hintStyle: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeMedium),
                          hintText: sh_hint_confirm_password,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: sh_colorPrimary, width: 0.5)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0), borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 0))),
                    ),
                    SizedBox(
                      height: spacing_xlarge,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      // height: double.infinity,
                      child: MaterialButton(
                        padding: EdgeInsets.all(spacing_standard),
                        child: text(sh_lbl_sign_up, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_white),
                        textColor: sh_white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                        color: sh_colorPrimary,
                        onPressed: () => {},
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      // height: double.infinity,
                      child: MaterialButton(
                        padding: EdgeInsets.all(spacing_standard),
                        child: text(sh_lbl_sign_in, fontSize: textSizeNormal, fontFamily: fontMedium, textColor: sh_colorPrimary),
                        textColor: sh_white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0), side: BorderSide(color: sh_colorPrimary, width: 1)),
                        color: sh_white,
                        onPressed: () => {finish(context)},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
