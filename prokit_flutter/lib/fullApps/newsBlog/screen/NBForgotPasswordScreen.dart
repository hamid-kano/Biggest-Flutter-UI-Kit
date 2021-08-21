import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/newsBlog/utils/NBWidgets.dart';

class NBForgotPasswordScreen extends StatefulWidget {
  @override
  NBForgotPasswordScreenState createState() => NBForgotPasswordScreenState();
}

class NBForgotPasswordScreenState extends State<NBForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Forgot Password', elevation: 0),
      body: Column(
        children: [
          16.height,
          nbAppTextFieldWidget(emailController, 'Email Address', TextFieldType.EMAIL),
          16.height,
          nbAppButtonWidget(context, 'Send Password', () {
            finish(context);
          })
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
