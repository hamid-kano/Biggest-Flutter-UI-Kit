import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSSignInScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSWalkthroughScreen1.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';

class CSCreateAccountScreenByEmail extends StatefulWidget {
  static String tag = '/CSCreateAccountScreenByEmail';

  @override
  CSCreateAccountScreenByEmailState createState() => CSCreateAccountScreenByEmailState();
}

class CSCreateAccountScreenByEmailState extends State<CSCreateAccountScreenByEmail> {
  bool? checked = false;

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
      appBar: appBarWidget("Create a Cloudbox Account"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(CSGoogleLogo, height: 50, width: 50),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("John Doe", style: boldTextStyle(size: 16)),
                  Text(
                    "john@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ]).paddingLeft(30),
              ],
            ).paddingOnly(bottom: 15, top: 20, left: 20, right: 20),
            Wrap(
              children: [
                RichText(
                    text: TextSpan(
                        text: "Looks like there is no Cloudbox account with the email address ",
                        style: primaryTextStyle(size: 19),
                        children: [TextSpan(text: "skg1498@gmail.com.", style: boldTextStyle(size: 19)), TextSpan(text: " Would you like to create one?")]))
              ],
            ).paddingOnly(bottom: 15, left: 20, right: 20),
            buildDivider(isFull: true),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
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
                      activeColor: CSGreyColor),
                  RichText(
                      text: TextSpan(text: "I agree to the ", style: TextStyle(color: Colors.black), children: [
                    TextSpan(
                        text: "Cloudbox terms",
                        style: TextStyle(
                          color: CSDarkBlueColor,
                          decoration: TextDecoration.underline,
                        ))
                  ])),
                ],
              ),
            ),
            buildDivider(isFull: true),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: context.width() * 0.9,
              decoration: boxDecorationRoundedWithShadow(5, backgroundColor: checked! ? CSDarkBlueColor : CSGreyColor, spreadRadius: 1, blurRadius: 0, shadowColor: Colors.grey, offset: Offset(0, 1)),
              height: context.width() * 0.13,
              child: Text("Create Account", style: boldTextStyle(color: Colors.white)),
            ).onTap(() {
              CSWalkthroughScreen1().launch(context);
            }).paddingTop(10),
            TextButton(
              onPressed: () {
                CSSignInScreen().launch(context);
                finish(context);
              },
              child: Text("Already have an account?", style: boldTextStyle(size: 17, color: CSDarkBlueColor)),
            ).paddingTop(10)
          ],
        ),
      ),
    );
  }
}
