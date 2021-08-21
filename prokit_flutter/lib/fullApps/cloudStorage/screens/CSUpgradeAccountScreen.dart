import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSConstants.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSWidgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CSUpgradeAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CSCommonAppBar(context, title: "Upgrade to $CSAppName Plus"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext ctx) {
              return Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -15,
                          right: -10,
                          child: IconButton(
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                            iconSize: 30,
                            color: CSDarkBlueColor,
                            onPressed: (() {
                              finish(context);
                            }),
                          ),
                        ),
                        Column(
                          children: [
                            Text("Subscription Details", textAlign: TextAlign.start, style: boldTextStyle()),
                            Wrap(
                              children: [
                                Text(
                                  'This subscription automatically renews after the 30-day free trial. You can turn off auto-renew at least 24 hours'
                                  'before your billing periods ends',
                                ).paddingOnly(top: 10, bottom: 10),
                                RichText(
                                  text: TextSpan(
                                    text: "By upgrading your account, you agree to $CSAppName\'s ",
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            const url = "https://www.google.com/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                        text: "Terms of Service",
                                        style: TextStyle(decoration: TextDecoration.underline, color: CSDarkBlueColor),
                                      ),
                                      TextSpan(text: " and ", style: TextStyle(color: Colors.black)),
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            const url = "https://www.google.com/";
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                        text: "Privacy Policy",
                                        style: TextStyle(decoration: TextDecoration.underline, color: CSDarkBlueColor),
                                      ),
                                    ],
                                  ),
                                ).onTap(() {}),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        label: Text("Subscription Details", style: TextStyle(color: Colors.white)),
        backgroundColor: CSDarkBlueColor,
        icon: Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(CSCloudboxLogo, height: 150, width: 150),
                Text("Do more with Cloudbox Plus", style: boldTextStyle()).paddingOnly(top: 10, bottom: 10),
                buildListTileForUpgradeAccount("Automatically back up your camera roll to keep your photos and videos safe"),
                buildListTileForUpgradeAccount("2 TB (2,000 GB) of space for all your important memories and work"),
                buildListTileForUpgradeAccount("Easily save, view, and share files on your phone and computer anywhere"),
                buildListTileForUpgradeAccount("Access files and folders offline from all your linked videos"),
                Text("Start your 30-day free trial", style: boldTextStyle(size: 17)).paddingTop(10),
                Text("Then US \$11.99 per month", style: boldTextStyle(size: 12, color: Colors.grey)).paddingTop(10),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  color: CSDarkBlueColor,
                  child: Text("Upgrade for free for 30 Days", style: boldTextStyle(color: Colors.white, size: 18)),
                ).paddingTop(10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildListTileForUpgradeAccount(String title) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      leading: Icon(Icons.cloud_done, color: Colors.green),
      title: Text(title, style: TextStyle(fontSize: 15)),
    );
  }
}
