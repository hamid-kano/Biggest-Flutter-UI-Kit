import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';

class MBecomeAMemberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            finish(context);
          },
          color: white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Unlimited reading. Free for 1 month.",
              textAlign: TextAlign.center,
              style: boldTextStyle(color: Colors.white, size: 30),
            ).paddingSymmetric(horizontal: 16),
            30.height,
            Text(
              "Read on any device, ad-free and offline.",
              textAlign: TextAlign.center,
              style: boldTextStyle(color: Colors.white, size: 14),
            ),
            Text(
              "We'll remind you 3 days before your trial ends.",
              textAlign: TextAlign.center,
              style: boldTextStyle(color: Colors.white, size: 14),
            ),
            Text(
              "Cancel anytime.",
              textAlign: TextAlign.center,
              style: boldTextStyle(color: Colors.white, size: 14),
            ),
            30.height,
            Container(
              height: 170,
              padding: EdgeInsets.all(16),
              color: mGreyColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("₹330/month", style: boldTextStyle(color: white, size: 24)),
                  Text("First month free", style: boldTextStyle(color: white, size: 16)),
                  20.height,
                  Container(
                    height: 50,
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: white, borderRadius: BorderRadius.circular(3)),
                    child: Text("Start your free trial", style: primaryTextStyle(size: 16)).center(),
                  )
                ],
              ),
            ),
            50.height,
            Text("₹3,250/year (save 17%)", style: boldTextStyle(color: white, size: 24)),
            Text("First month free", style: boldTextStyle(color: white, size: 16)),
            20.height,
            Container(
              height: 50,
              width: context.width() * 0.7,
              decoration: boxDecorationWithRoundedCorners(backgroundColor: black, border: Border.all(color: white), borderRadius: BorderRadius.circular(3)),
              // ignore: deprecated_member_use
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Start your free trial",
                  style: primaryTextStyle(color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ).paddingAll(16),
      ).center(),
    );
  }
}
