import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

class OPTransactionDetailsScreen extends StatefulWidget {
  @override
  _OPTransactionDetailsScreenState createState() => _OPTransactionDetailsScreenState();
}

class _OPTransactionDetailsScreenState extends State<OPTransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar('12 March 1997', pressed: () {
          finish(context);
        }),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 30),
                    margin: EdgeInsets.all(16),
                    decoration: boxDecoration(radius: 16, shadowColor: opPrimaryColor.withOpacity(0.2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            '₹250.00',
                            style: boldTextStyle(size: 30, color: Colors.white),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.white30,
                        ),
                        FittedBox(
                          child: RichText(
                            text: TextSpan(text: 'You Successfully sent to', style: secondaryTextStyle(color: Colors.white60), children: <TextSpan>[
                              TextSpan(
                                text: ' JennieYRB',
                                style: primaryTextStyle(color: Colors.white),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Id: 10000000000002',
                          style: secondaryTextStyle(size: 18),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 10, bottom: 20),
                          child: Divider(
                            thickness: 0.8,
                          ),
                        ),
                        Text(
                          '-₹50',
                          style: secondaryTextStyle(size: 18),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 10, bottom: 20),
                          child: Divider(
                            thickness: 0.8,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ButtonBars(
                        title: 'Print',
                        icon: Icons.print,
                        color: opPrimaryColor,
                      ),
                      ButtonBars(
                        size: size,
                        title: 'Refund',
                        icon: Icons.assignment_return,
                        color: opOrangeColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
