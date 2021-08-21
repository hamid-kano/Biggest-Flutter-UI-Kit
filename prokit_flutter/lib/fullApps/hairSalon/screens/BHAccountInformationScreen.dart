import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';

class BHAccountInformationScreen extends StatefulWidget {
  static String tag = '/AccountInformationScreen';

  @override
  BHAccountInformationScreenState createState() => BHAccountInformationScreenState();
}

class BHAccountInformationScreenState extends State<BHAccountInformationScreen> {
  bool _showPassword = true;
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController dOBCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController phoneNumCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode dOBFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneNumFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: blackColor),
          ),
          title: Text(BHTxtAccountInformation, style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(BHTxtEdit, style: TextStyle(color: BHColorPrimary, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            )
          ]),
      body: Container(
        color: BHGreyColor.withOpacity(0.1),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: whiteColor,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(child: CircleAvatar(backgroundImage: AssetImage(BHDashedBoardImage3), radius: 50)),
                    Padding(
                      padding: EdgeInsets.only(left: 80, top: 60),
                      child: IconButton(icon: Image.asset(BHAddIcon, height: 21, width: 21), onPressed: () {}),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(offset: Offset(0.0, 1.0), color: BHGreyColor.withOpacity(0.3), blurRadius: 2.0),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullNameCont,
                      focusNode: fullNameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(dOBFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                      ),
                    ),
                    TextFormField(
                      controller: dOBCont,
                      focusNode: dOBFocusNode,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailFocusNode);
                      },
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        labelText: "Date of Birth",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2014, 8),
                              lastDate: DateTime(2101),
                            );
                          },
                          child: Icon(Icons.calendar_today, color: BHColorPrimary, size: 16),
                        ),
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      controller: emailCont,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(phoneNumFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                      ),
                    ),
                    TextFormField(
                      controller: phoneNumCont,
                      focusNode: phoneNumFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passWordFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(color: BHGreyColor, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                      ),
                    ),
                    TextFormField(
                      controller: passwordCont,
                      focusNode: passWordFocusNode,
                      obscureText: _showPassword,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: BHAppTextColorSecondary),
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
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHAppDividerColor)),
                      ),
                    ),
                    24.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
