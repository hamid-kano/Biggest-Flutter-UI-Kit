import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Style.dart';

class OPTransferReviewScreen extends StatefulWidget {
  @override
  _OPTransferReviewScreenState createState() => _OPTransferReviewScreenState();
}

class _OPTransferReviewScreenState extends State<OPTransferReviewScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar('Transfer', pressed: () {
          finish(context);
        }),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
                    margin: EdgeInsets.all(16),
                    width: size.width,
                    decoration: boxDecoration(radius: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '₹250.00',
                          style: boldTextStyle(color: Colors.white, size: 26),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Divider(
                            color: Colors.white30,
                          ),
                        ),
                        Text(
                          'Jennieyourbae@gmail.com',
                          style: primaryTextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.all(16),
                    decoration: boxDecoration(backGroundColor: opOrangeColor, radius: 15),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          height: 40,
                          width: 30,
                          child: Icon(
                            Icons.add,
                            size: 25,
                            color: opOrangeColor,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Add note",
                          style: primaryTextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(16),
                  width: double.infinity,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: Image.asset('images/orapay/opthanks.png'),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              TextButton(
                                child: new Text("CLOSE"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Review",
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(size: 16, color: Colors.white),
                    ),
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
