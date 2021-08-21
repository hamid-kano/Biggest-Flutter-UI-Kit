import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/themes/theme7/utils/T7Widget.dart';

import '../../../main.dart';

class T7SignIn extends StatefulWidget {
  static String tag = '/T7SignIn';

  @override
  T7SignInState createState() => T7SignInState();
}

class T7SignInState extends State<T7SignIn> with SingleTickerProviderStateMixin {
  bool passwordObscure = true;
  bool cPasswordObscure = true;
  bool sPasswordObscure = true;
  bool scPasswordObscure = true;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                color: appStore.appBarColor,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Container()),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.58,
                        child: TabBar(
                          indicatorColor: t7colorPrimary,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(t7_login, style: TextStyle(fontSize: 16.0, color: appStore.textPrimaryColor, fontFamily: fontRegular)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(t7_sign_up, style: TextStyle(fontSize: 16.0, color: appStore.textPrimaryColor, fontFamily: fontRegular)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16),
                      T7EditTextStyle(t7_email, t7_email),
                      TextFormField(
                        autofocus: false,
                        obscureText: passwordObscure,
                        keyboardType: TextInputType.text,
                        style: primaryTextStyle(),
                        decoration: InputDecoration(
                          hintText: t7_password,
                          hintStyle: primaryTextStyle(),
                          contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: t7view_color, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: t7view_color, width: 0.0),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                passwordObscure = !passwordObscure;
                              });
                            },
                            child: Icon(
                              passwordObscure ? Icons.visibility : Icons.visibility_off,
                              color: appStore.iconColor,
                              semanticLabel: passwordObscure ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      text(t7_forgot_password, textColor: t7textColorSecondary),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            child: T7Button(
                              textContent: t7_login,
                              onPressed: () {},
                              bgColor: t7view_color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16),
                      T7EditTextStyle(t7_name, t7_name),
                      T7EditTextStyle(t7_email, t7_email),
                      TextFormField(
                        autofocus: false,
                        obscureText: sPasswordObscure,
                        keyboardType: TextInputType.text,
                        style: primaryTextStyle(),
                        decoration: InputDecoration(
                          hintText: t7_password,
                          hintStyle: primaryTextStyle(),
                          contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: t7view_color, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: t7view_color, width: 0.0),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                sPasswordObscure = !sPasswordObscure;
                              });
                            },
                            child: Icon(
                              sPasswordObscure ? Icons.visibility : Icons.visibility_off,
                              color: appStore.iconColor,
                              semanticLabel: sPasswordObscure ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: scPasswordObscure,
                        keyboardType: TextInputType.text,
                        style: primaryTextStyle(),
                        decoration: InputDecoration(
                          hintText: t7_confirm_password,
                          hintStyle: primaryTextStyle(),
                          contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: t7view_color, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: t7view_color, width: 0.0),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                scPasswordObscure = !scPasswordObscure;
                              });
                            },
                            child: Icon(
                              scPasswordObscure ? Icons.visibility : Icons.visibility_off,
                              color: appStore.iconColor,
                              semanticLabel: scPasswordObscure ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            child: T7Button(
                              textContent: t7_sign_up,
                              onPressed: () {},
                              bgColor: t7view_color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
