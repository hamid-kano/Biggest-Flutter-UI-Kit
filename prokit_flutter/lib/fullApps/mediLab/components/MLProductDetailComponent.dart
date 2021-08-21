import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLProductMoreDetailScreen.dart';

class MLProductDetailComponent extends StatefulWidget {
  static String tag = '/MLProductDetailComponent';

  @override
  MLProductDetailComponentState createState() => MLProductDetailComponentState();
}

class MLProductDetailComponentState extends State<MLProductDetailComponent> {
  String? pillName = 'Tmrw Pill Bottle Vitamin';
  String? numberOfPill = 'Tablets : 50/100/150 Pills';
  bool? liked = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topLeft: 24, topRight: 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(pillName!, style: boldTextStyle(size: 20)),
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithRoundedCorners(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: radius(24),
                ),
                child: liked == true
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            liked = false;
                          });
                        },
                        child: Icon(Icons.favorite, color: Colors.red, size: 16),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            liked = true;
                          });
                        },
                        child: Icon(Icons.favorite_outline, color: Colors.grey, size: 16),
                      ),
              ),
            ],
          ),
          8.height,
          Text(numberOfPill!, style: boldTextStyle(color: Colors.grey)),
          8.height,
          Row(
            children: [
              Text('\$250.00 ', style: boldTextStyle(size: 20, color: Colors.blue.shade600)),
              4.width,
              Text('\$350.00 ', style: boldTextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
            ],
          ),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16).expand(flex: 1),
              4.width,
              Text('4.8 (456 Reviews) ', style: boldTextStyle(size: 14, color: black)),
              4.width,
              Text(' | 10 in stock', style: boldTextStyle(size: 14, color: black)),
              4.width,
              Container(
                alignment: Alignment.centerRight,
                child: LinearProgressIndicator(
                  minHeight: 5.0,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  value: 0.6,
                ),
              ).expand(flex: 5),
            ],
          ),
          16.height,
          Divider(thickness: 1.0),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Overview', style: boldTextStyle()),
              Icon(Icons.arrow_forward_ios_outlined, size: 20, color: Colors.blue.shade600),
            ],
          ).onTap(() {
            MLProductMoreDetailScreen().launch(context);
          }),
          8.height,
          Divider(thickness: 1.0),
          8.height,
          Text('Specification', style: boldTextStyle()),
          16.height,
          Table(
            children: [
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_hospital_outlined, color: Colors.blue, size: 18),
                        4.width,
                        Text('Brand', style: boldTextStyle()),
                      ],
                    ),
                    4.height,
                    Text('Tmrw Pharmacy', style: secondaryTextStyle(size: 16)),
                  ],
                ).paddingRight(16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.people_alt_outlined, color: Colors.blue, size: 18),
                        4.width,
                        Text('Age Range', style: boldTextStyle()),
                      ],
                    ),
                    4.height,
                    Text('Adult', style: secondaryTextStyle(size: 16)),
                  ],
                ),
              ])
            ],
          ),
          64.height,
        ],
      ),
    );
  }
}
