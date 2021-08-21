import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSSignUpScreen extends StatefulWidget {
  static String tag = '/CSSignUpScreen';

  @override
  CSSignUpScreenState createState() => CSSignUpScreenState();
}

class CSSignUpScreenState extends State<CSSignUpScreen> {
  bool? checked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CSCommonAppBar(context, title: 'Sign up for Cloudbox'),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return "Please enter first name";
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration("First Name"),
                  ),
                  20.height,
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return "Please enter last name";
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration("Last Name"),
                  ),
                  20.height,
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: buildInputDecoration("Email"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter email address";
                        } else if (!val.validateEmail()) {
                          return "Please enter valid email address";
                        }
                        return null;
                      }),
                  20.height,
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: buildInputDecoration("Password"),
                  ),
                  20.height,
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      children: [
                        Checkbox(
                          value: this.checked,
                          checkColor: CSDarkBlueColor,
                          onChanged: (val) {
                            setState(() {
                              this.checked = val;
                            });
                          },
                          activeColor: CSGreyColor,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Cloudbox terms",
                                style: TextStyle(
                                  color: CSDarkBlueColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(width: 1.5, color: CSGreyColor),
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: context.width() * 0.9,
                    decoration: boxDecorationRoundedWithShadow(
                      5,
                      backgroundColor: checked! ? CSDarkBlueColor : CSGreyColor,
                      spreadRadius: 1,
                      blurRadius: 0,
                      shadowColor: Colors.grey,
                      offset: Offset(0, 1),
                    ),
                    height: context.width() * 0.13,
                    child: Text("Sign Up", style: boldTextStyle(color: Colors.white)),
                  ).onTap(() {
                    if (_formKey.currentState!.validate()) {
                      toastLong("Done");
                    }
                  }),
                  20.height,
                  googleSignInWidget(),
                  20.height,
                  TextButton(
                    onPressed: () {
                      finish(context);
                    },
                    child: Text("Sign in", style: boldTextStyle(size: 17, color: CSDarkBlueColor)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
