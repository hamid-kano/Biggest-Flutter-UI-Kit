import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBColors.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBSingUpScreen extends StatefulWidget {
  static String tag = '/NBSingUpScreen';

  @override
  NBSingUpScreenState createState() => NBSingUpScreenState();
}

class NBSingUpScreenState extends State<NBSingUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,
            Text('Create new\naccount', style: boldTextStyle(size: 30)),
            30.height,
            nbAppTextFieldWidget(nameController, 'Name', TextFieldType.NAME, focus: nameFocus, nextFocus: emailFocus),
            16.height,
            nbAppTextFieldWidget(emailController, 'Email Address', TextFieldType.EMAIL, focus: emailFocus, nextFocus: phoneFocus),
            16.height,
            nbAppTextFieldWidget(phoneController, 'Phone Number', TextFieldType.PHONE, focus: phoneFocus, nextFocus: passwordFocus),
            16.height,
            nbAppTextFieldWidget(passwordController, 'Password', TextFieldType.PASSWORD, focus: passwordFocus),
            50.height,
            nbAppButtonWidget(context, 'Create Account', () {
              finish(context);
            }),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an Account?', style: primaryTextStyle()),
                Text(' Sign In', style: boldTextStyle(color: NBPrimaryColor)).onTap(() {
                  finish(context);
                }),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
