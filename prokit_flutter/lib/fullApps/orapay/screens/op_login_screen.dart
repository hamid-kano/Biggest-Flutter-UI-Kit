import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

import 'op_user_detail.dart';

class OPLoginScreen extends StatefulWidget {
  @override
  _OPLoginScreenState createState() => _OPLoginScreenState();
}

class _OPLoginScreenState extends State<OPLoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16, bottom: 24, right: 16),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100),
                    applogo(),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Login",
                      style: boldTextStyle(size: 24, letterSpacing: 0.2),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextField(
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: secondaryTextStyle(size: 16),
                        fillColor: Colors.grey,
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: secondaryTextStyle(size: 16),
                        fillColor: Colors.grey,
                        suffixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: size.width - 32,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: opPrimaryColor,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    finish(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OPUserDetailsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(size: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
