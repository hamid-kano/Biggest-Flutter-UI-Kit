import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14AutorisationScreen extends StatefulWidget {
  @override
  _T14AutorisationScreenState createState() => _T14AutorisationScreenState();
}

class _T14AutorisationScreenState extends State<T14AutorisationScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(t14_authorisation, width: context.width(), fit: BoxFit.cover),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('Skip', style: boldTextStyle(size: 14)).onTap(() {
                        finish(context);
                      }).paddingOnly(right: 16, top: 8)),
                ],
              ),
              Column(
                children: [
                  Text('Authorization', style: boldTextStyle(size: 18)),
                  Text(t14_txt_authorisation_subtitle, textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)).paddingOnly(top: 8),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      hintText: 'Enter country name',
                      helperStyle: TextStyle(fontSize: 12),
                      hintStyle: TextStyle(color: t14_colorBlue.withOpacity(0.2)),
                      filled: true,
                      fillColor: t14_colorWhite,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: t14_colorBlue.withOpacity(0.2), width: 0.6),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: t14_colorBlue.withOpacity(0.2), width: 0.6),
                      ),
                    ),
                  ).paddingOnly(top: 16, bottom: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: t14_colorBlue.withOpacity(0.2), width: 0.6),
                          ),
                          child: CountryCodePicker(onChanged: print, initialSelection: 'IT', favorite: ['+39'])),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            counter: 0.height,
                            hintText: 'Type a number',
                            helperStyle: TextStyle(fontSize: 12),
                            hintStyle: TextStyle(color: t14_colorBlue.withOpacity(0.2)),
                            filled: true,
                            fillColor: t14_colorWhite,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: t14_colorBlue.withOpacity(0.2), width: 0.6),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: t14_colorBlue.withOpacity(0.2), width: 0.6),
                            ),
                          ),
                        ),
                      ).expand(),
                    ],
                  ),
                  16.height,
                  t14AppButton(
                    context,
                    btnText: t14_txt_send_code,
                    bgColor: t14_SignInBgColor,
                    width: context.width(),
                    shape: 10.0,
                    txtColor: t14_colorSkyBlue,
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                ],
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
