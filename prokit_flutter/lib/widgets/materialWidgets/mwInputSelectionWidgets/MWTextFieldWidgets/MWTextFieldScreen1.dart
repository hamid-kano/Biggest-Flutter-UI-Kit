import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWTextFieldScreen1 extends StatefulWidget {
  static String tag = "/MWTextFieldScreen1";

  @override
  _MWTextFieldScreen1State createState() => _MWTextFieldScreen1State();
}

class _MWTextFieldScreen1State extends State<MWTextFieldScreen1> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Simple TextField'),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            children: <Widget>[
              SizedBox(height: 20),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  labelText: 'Username',
                  labelStyle: primaryTextStyle(size: 14),
                  filled: true,
                ),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  labelText: "E-Mail",
                  labelStyle: primaryTextStyle(size: 14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: appStore.iconColor,
                  ),
                  filled: true,
                ),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                obscureText: passwordVisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: primaryTextStyle(size: 14),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appStore.textPrimaryColor!),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appStore.textPrimaryColor!),
                    ),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: appStore.iconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appStore.textPrimaryColor!),
                  ),
                  labelText: "Phone Number",
                  labelStyle: primaryTextStyle(size: 14),
                  prefixIcon: Icon(Icons.phone, color: Colors.blue),
                  filled: true,
                ),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.textPrimaryColor!)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.textPrimaryColor!)),
                  labelText: "Pincode",
                  labelStyle: primaryTextStyle(size: 14),
                  filled: true,
                  counterStyle: secondaryTextStyle(),
                ),
                maxLength: 6,
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
