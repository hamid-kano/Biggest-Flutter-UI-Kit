import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BHResetPasswordScreen.dart';

class BHVerificationScreen extends StatefulWidget {
  static String tag = '/VerificationScreen';

  @override
  BHVerificationScreenState createState() => BHVerificationScreenState();
}

class BHVerificationScreenState extends State<BHVerificationScreen> {
  FocusNode firstDigit = FocusNode();
  FocusNode secondDigit = FocusNode();
  FocusNode thirdDigit = FocusNode();
  FocusNode forthDigit = FocusNode();
  FocusNode fifthDigit = FocusNode();

  int _counter = 10;
  Timer? _timer;

  void _startTimer() {
    _counter = 10;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
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
                    Text(BHTxtVerification, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: BHAppTextColorPrimary)),
                    SizedBox(height: 16),
                    Text(BHVerificationTitle, textAlign: TextAlign.center, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(color: blackColor),
                            focusNode: firstDigit,
                            keyboardType: TextInputType.number,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                firstDigit.unfocus();
                                FocusScope.of(context).requestFocus(secondDigit);
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            focusNode: secondDigit,
                            keyboardType: TextInputType.number,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                secondDigit.unfocus();
                                FocusScope.of(context).requestFocus(thirdDigit);
                              }
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            focusNode: thirdDigit,
                            keyboardType: TextInputType.number,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                thirdDigit.unfocus();
                                FocusScope.of(context).requestFocus(forthDigit);
                              }
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            focusNode: forthDigit,
                            keyboardType: TextInputType.number,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                forthDigit.unfocus();
                                FocusScope.of(context).requestFocus(fifthDigit);
                              }
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            focusNode: fifthDigit,
                            keyboardType: TextInputType.number,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                fifthDigit.unfocus();
                              }
                            },
                            style: TextStyle(color: blackColor),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BHColorPrimary)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    8.height,
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _startTimer();
                            },
                            child: Text(BHTxtResendOn, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: BHColorPrimary)),
                          ),
                          8.width,
                          Text('0: $_counter', style: TextStyle(color: BHColorPrimary, fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
                    16.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          padding: EdgeInsets.all(12),
                          primary: BHColorPrimary,
                        ),
                        onPressed: () {
                          finish(context);
                          BHResetPasswordScreen().launch(context);
                        },
                        child: Text(BHBtnContinue, style: TextStyle(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold)),
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
