import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPForgotPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPWidget.dart';

class MPTabBarSignInScreen extends StatefulWidget {
  final int selectedPage;

  MPTabBarSignInScreen(this.selectedPage);

  @override
  MPTabBarSignInScreenState createState() => MPTabBarSignInScreenState();
}

class MPTabBarSignInScreenState extends State<MPTabBarSignInScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool? checkedValue = false;

  TextEditingController contEmailAddress = TextEditingController();
  TextEditingController contPassword = TextEditingController();

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  FocusNode focusNodePassword = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.selectedPage,
      length: 2,
      child: Scaffold(
        backgroundColor: mpAppBackGroundColor,
        appBar: AppBar(
          backgroundColor: mpAppBackGroundColor,
          automaticallyImplyLeading: false,
          bottomOpacity: 1,
          bottom: TabBar(
            unselectedLabelColor: mpAppTextColor,
            labelColor: white,
            tabs: [
              Tab(child: Text('Sign in')),
              Tab(child: Text('Sign up')),
            ],
            indicatorColor: mpAppButtonColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                AppTextField(
                  controller: contEmailAddress,
                  textStyle: primaryTextStyle(color: white),
                  nextFocus: focusNodePassword,
                  cursorColor: Colors.white,
                  textFieldType: TextFieldType.EMAIL,
                  decoration: buildInputDecoration('Your Email Address'),
                ),
                16.height,
                AppTextField(
                  controller: contPassword,
                  textStyle: primaryTextStyle(color: white),
                  focus: focusNodePassword,
                  cursorColor: Colors.white,
                  textFieldType: TextFieldType.PASSWORD,
                  suffixIconColor: mpAppButtonColor,
                  decoration: buildInputDecoration('Your password'),
                ),
                16.height,
                Align(
                  alignment: Alignment.topRight,
                  child: Text('Forgot Password?', style: primaryTextStyle(color: mpAppButtonColor, size: 14)),
                ).onTap(() {
                  MPForgotPasswordScreen().launch(context);
                }),
                16.height,
                Theme(
                  data: ThemeData(unselectedWidgetColor: white),
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Remember Me", style: secondaryTextStyle(color: Colors.white)),
                    value: checkedValue,
                    dense: true,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                16.height,
                AppButton(
                  child: Text('Sign in', style: primaryTextStyle(color: Colors.white)),
                  color: mpAppButtonColor,
                  width: context.width(),
                  onTap: () {
                    finish(context);
                    MPDashboardScreen().launch(context);
                  },
                ).cornerRadiusWithClipRRect(24),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 0.5, width: 110, color: Colors.white.withOpacity(0.2)),
                    8.width,
                    Text('OR', style: TextStyle(color: Colors.grey)),
                    8.width,
                    Container(height: 0.5, width: 110, color: Colors.white.withOpacity(0.2)),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      child: Text('Facebook', style: primaryTextStyle(color: Colors.white)),
                      color: mpFacebookBtnBgColor,
                      width: 120,
                      onTap: () {},
                    ).cornerRadiusWithClipRRect(24),
                    24.width,
                    AppButton(
                      child: Text('Twitter', style: primaryTextStyle(color: Colors.white)),
                      color: mpTwitterBtnBgColor,
                      width: 120,
                      onTap: () {},
                    ).cornerRadiusWithClipRRect(24),
                  ],
                ),
              ]).paddingOnly(top: 70, right: 16, left: 16, bottom: 16),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  AppTextField(
                    controller: controllerName,
                    textStyle: primaryTextStyle(color: white),
                    textFieldType: TextFieldType.EMAIL,
                    nextFocus: addressFocusNode,
                    cursorColor: Colors.white,
                    decoration: buildInputDecoration('Your Name'),
                  ),
                  16.height,
                  AppTextField(
                    controller: controllerEmailAddress,
                    textStyle: primaryTextStyle(color: white),
                    textFieldType: TextFieldType.EMAIL,
                    focus: addressFocusNode,
                    cursorColor: Colors.white,
                    nextFocus: passwordFocusNode,
                    decoration: buildInputDecoration('Your Email Address'),
                  ),
                  16.height,
                  AppTextField(
                    controller: controllerPassword,
                    textStyle: primaryTextStyle(color: white),
                    textFieldType: TextFieldType.PASSWORD,
                    focus: passwordFocusNode,
                    cursorColor: Colors.white,
                    suffixIconColor: mpAppButtonColor,
                    decoration: buildInputDecoration('Your password'),
                  ),
                  20.height,
                  AppButton(
                    child: Text('Sign up', style: primaryTextStyle(color: Colors.white)),
                    color: mpAppButtonColor,
                    width: context.width(),
                    onTap: () {
                      finish(context);
                      MPDashboardScreen().launch(context);
                    },
                  ).cornerRadiusWithClipRRect(24),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        child: Text('Facebook', style: primaryTextStyle(color: Colors.white)),
                        color: mpFacebookBtnBgColor,
                        width: 120,
                        onTap: () {},
                      ).cornerRadiusWithClipRRect(24),
                      24.width,
                      AppButton(
                        child: Text('Twitter', style: primaryTextStyle(color: Colors.white)),
                        color: mpTwitterBtnBgColor,
                        width: 120,
                        onTap: () {},
                      ).cornerRadiusWithClipRRect(24),
                    ],
                  ),
                ],
              ).paddingOnly(top: 70, right: 16, left: 16, bottom: 16),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
