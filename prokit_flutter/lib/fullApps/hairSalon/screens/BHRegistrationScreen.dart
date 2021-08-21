import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class BHRegistrationScreen extends StatefulWidget {
  static String tag = '/NewRegistrationScreen';

  @override
  NewRegistrationScreenState createState() => NewRegistrationScreenState();
}

class NewRegistrationScreenState extends State<BHRegistrationScreen> {
  bool _showPassword = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController dateOfBirthCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    dobFocusNode.dispose();
    addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(BHColorPrimary);

    return SafeArea(
      child: Scaffold(
        backgroundColor: BHColorPrimary,
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(BHAppLogo, color: white.withOpacity(0.8), height: 150, width: 150),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                color: whiteColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: fullNameCont,
                      focusNode: fullNameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      controller: passwordCont,
                      focusNode: passwordFocusNode,
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.text,
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
                      controller: emailCont,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(dobFocusNode);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Email",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      controller: dateOfBirthCont,
                      keyboardType: TextInputType.datetime,
                      focusNode: dobFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(addressFocusNode);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Date of Birth",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2014, 8), lastDate: DateTime(2101));
                          },
                          child: Icon(Icons.calendar_today, color: BHColorPrimary, size: 16),
                        ),
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      controller: addressCont,
                      focusNode: addressFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                        labelText: "Your Address",
                        suffixIcon: Icon(Icons.location_on, color: BHColorPrimary, size: 18),
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                      ),
                    ),
                    16.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          finish(context);
                        },
                        child: Text(
                          BHBtnSignUp,
                          style: TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    24.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          finish(context);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: BHTxtAccount,
                            style: TextStyle(color: BHAppTextColorSecondary),
                            children: <TextSpan>[TextSpan(text: BHBtnSignIn, style: TextStyle(color: BHColorPrimary))],
                          ),
                        ),
                      ),
                    ),
                    8.height,
                  ],
                ),
              ),
            ),
            BackButton(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
