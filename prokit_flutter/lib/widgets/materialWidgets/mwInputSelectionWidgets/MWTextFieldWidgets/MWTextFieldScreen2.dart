import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWTextFieldScreen2 extends StatefulWidget {
  static String tag = "/MWTextFieldScreen2";

  @override
  _MWTextFieldScreen2State createState() => _MWTextFieldScreen2State();
}

class _MWTextFieldScreen2State extends State<MWTextFieldScreen2> {
  bool? passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Rounded Border TextField'),
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
                  labelText: "UserName",
                  alignLabelWithHint: false,
                  fillColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                ),
                cursorColor: white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: appStore.textSecondaryColor),
                    alignLabelWithHint: false,
                    filled: true),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                obscureText: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    labelText: "Message",
                    labelStyle: TextStyle(color: appStore.textSecondaryColor),
                    alignLabelWithHint: false,
                    filled: true),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: appStore.textSecondaryColor),
                    alignLabelWithHint: false,
                    filled: true),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: appStore.iconColor!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                  ),
                  hintText: "New Phone Number",
                  hintStyle: TextStyle(color: appStore.textSecondaryColor),
                  labelStyle: TextStyle(color: appStore.textSecondaryColor),
                  labelText: "New Phone Number",
                  alignLabelWithHint: false,
                  filled: true,
                ),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Address",
                  hintStyle: TextStyle(color: Colors.white30),
                  alignLabelWithHint: false,
                  fillColor: Colors.blue,
                  filled: true,
                ),
                textInputAction: TextInputAction.done,
              ),
              TextField(
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: appStore.iconColor!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                  ),
                  labelText: "Ticket Form",
                  hintText: "write....",
                  hintStyle: TextStyle(color: appStore.textSecondaryColor),
                  labelStyle: TextStyle(color: appStore.textSecondaryColor),
                  alignLabelWithHint: true,
                  filled: true,
                ),
                cursorColor: appStore.isDarkModeOn ? white : blackColor,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
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
