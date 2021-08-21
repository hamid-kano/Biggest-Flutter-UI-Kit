import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDLoginScreen.dart';

class SDVerficationScreen extends StatefulWidget {
  @override
  _SDVerficationScreenState createState() => _SDVerficationScreenState();
}

class _SDVerficationScreenState extends State<SDVerficationScreen> {
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();
  FocusNode myFocusNode4 = FocusNode();

  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;

  void chnage() {
    myFocusNode1.addListener(() {
      bool status;
      status = myFocusNode1.hasFocus;
      if (status == true) {
        setState(() {
          isActive1 = true;
        });
      } else {
        setState(() {
          isActive1 = false;
        });
      }
    });
    myFocusNode2.addListener(() {
      bool status;
      status = myFocusNode2.hasFocus;
      if (status == true) {
        setState(() {
          isActive2 = true;
        });
      } else {
        setState(() {
          isActive2 = false;
        });
      }
    });
    myFocusNode3.addListener(() {
      bool status;
      status = myFocusNode3.hasFocus;
      if (status == true) {
        setState(() {
          isActive3 = true;
        });
      } else {
        setState(() {
          isActive3 = false;
        });
      }
    });

    myFocusNode4.addListener(() {
      bool status;
      status = myFocusNode4.hasFocus;
      if (status == true) {
        setState(() {
          isActive4 = true;
        });
      } else {
        setState(() {
          isActive4 = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    chnage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 25, right: 25),
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Verify account', style: boldTextStyle(size: 25)),
                SizedBox(height: 25),
                Text('Please fill verification code that have been sent to your mobile phone', style: secondaryTextStyle(size: 16, color: sdTextSecondaryColor.withOpacity(0.7))),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: isActive1 == false ? boxDecorations(radius: 5, showShadow: true) : boxDecorations(radius: 5, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              focusNode: myFocusNode1,
                              onChanged: (term) {
                                if (term.isEmpty) {
                                  FocusScope.of(context).unfocus();
                                } else {
                                  FocusScope.of(context).requestFocus(myFocusNode2);
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(border: InputBorder.none),
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: isActive2 == false ? boxDecorations(radius: 5, showShadow: true) : boxDecorations(radius: 5, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              focusNode: myFocusNode2,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              onChanged: (term) {
                                if (term.isEmpty) {
                                  FocusScope.of(context).requestFocus(myFocusNode1);
                                } else {
                                  FocusScope.of(context).requestFocus(myFocusNode3);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: isActive3 == false ? boxDecorations(radius: 5, showShadow: true) : boxDecorations(radius: 5, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              focusNode: myFocusNode3,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(border: InputBorder.none),
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              onEditingComplete: () => FocusScope.of(context).previousFocus(),
                              onChanged: (term) {
                                if (term.isEmpty) {
                                  FocusScope.of(context).requestFocus(myFocusNode2);
                                } else {
                                  FocusScope.of(context).requestFocus(myFocusNode4);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: isActive4 == false ? boxDecorations(radius: 5, showShadow: true) : boxDecorations(radius: 5, showShadow: true),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextField(
                              focusNode: myFocusNode4,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(border: InputBorder.none),
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              onChanged: (term) {
                                if (term.isEmpty) {
                                  FocusScope.of(context).requestFocus(myFocusNode3);
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 85),
                SDButton(
                  textContent: "CONTINUE",
                  onPressed: () {
                    SDLoginScreen().launch(context);
                  },
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text('Did\'nt Received a code?', style: secondaryTextStyle(size: 16)),
                      SizedBox(height: 20),
                      Text('RESEND', style: boldTextStyle(color: sdPrimaryColor)),
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
