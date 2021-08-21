import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/screens/BHLoginScreen.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';

class BHResetPasswordScreen extends StatefulWidget {
  static String tag = '/ResetPasswordScreen';

  @override
  BHResetPasswordScreenState createState() => BHResetPasswordScreenState();
}

class BHResetPasswordScreenState extends State<BHResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showConformPassword = false;
  FocusNode newPassWordFocusNode = FocusNode();
  FocusNode confirmNewPassWordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    newPassWordFocusNode.dispose();
    confirmNewPassWordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              actionsPadding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
              actions: [
                Container(
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      finish(context);
                      finish(context);
                      finish(context);
                      BHLoginScreen().launch(context);
                    },
                    child: Text(
                      BHBtnOk,
                      style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
              content: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                height: 230,
                child: Column(
                  children: <Widget>[
                    Image.asset(BHAlertDialogLogo, height: 100, width: 100),
                    16.height,
                    Text(BHTxtCongratulation, style: TextStyle(color: BHColorPrimary, fontWeight: FontWeight.bold, fontSize: 20)),
                    16.height,
                    Text(
                      BHAlertDialogTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: BHColorPrimary,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(BHTxtResetPwd, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: BHAppTextColorPrimary)),
                    16.height,
                    Text(BHResetPasswordTitle, textAlign: TextAlign.center, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                    16.height,
                    TextFormField(
                      controller: newPasswordController,
                      focusNode: newPassWordFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(confirmNewPassWordFocusNode);
                      },
                      obscureText: !_showPassword,
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off, color: BHColorPrimary, size: 20),
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                      ),
                    ),
                    TextFormField(
                      controller: confirmNewPasswordController,
                      focusNode: confirmNewPassWordFocusNode,
                      obscureText: !_showConformPassword,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(confirmNewPassWordFocusNode);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        labelText: "Confirm new Password",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showConformPassword = !_showConformPassword;
                            });
                          },
                          child: Icon(_showConformPassword ? Icons.visibility : Icons.visibility_off, color: BHColorPrimary, size: 20),
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                      ),
                    ),
                    16.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: BHColorPrimary),
                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(BHBtnSend, style: TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
