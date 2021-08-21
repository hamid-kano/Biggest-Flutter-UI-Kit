import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14SubscriptionScreen extends StatefulWidget {
  @override
  _T14SubscriptionScreenState createState() => _T14SubscriptionScreenState();
}

class _T14SubscriptionScreenState extends State<T14SubscriptionScreen> {
  List<SubscriptionModel> subscriptionList = getSubscriptionList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: t14_colorWhite,
        appBar: AppBar(
          backgroundColor: t14_colorWhite,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Text(t14_txt_Subscription, style: boldTextStyle(color: t14_colorBlack, size: 18)),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.clear_rounded, size: 20),
                onPressed: () {
                  finish(context);
                })
          ],
        ),
        body: ListView.builder(
            itemCount: subscriptionList.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            itemBuilder: (BuildContext context, int index) {
              SubscriptionModel data = subscriptionList[index];
              return Column(
                children: [
                  Container(
                    width: context.width(),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: data.backgroundColor),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: CustomPaint(
                            painter: ShapesPainter(color: data.bannerColor),
                            child: Container(
                              height: 90,
                              width: 80,
                              child: Column(
                                children: [
                                  8.height,
                                  Text(data.name!, style: primaryTextStyle(color: t14_colorWhite)),
                                  8.height,
                                  Image.asset(data.img!, height: 20, width: 20, color: t14_colorWhite),
                                ],
                              ),
                            ),
                          ),
                        ),
                        16.height,
                        Text(data.price.toString(), style: boldTextStyle(color: t14_colorBlue, size: 22)),
                        8.height,
                        Text(t14_txt_PointsBalance, style: boldTextStyle(color: t14_SuccessTxtColor, size: 14)),
                        8.height,
                        Container(
                          width: 230,
                          margin: EdgeInsets.only(bottom: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: t14_colorWhite,
                              elevation: 0.0,
                              padding: EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {},
                            child: Text(t14_txt_BuyAccount, style: primaryTextStyle(color: t14_colorBlue)),
                          ),
                        ),
                        Text(t14_txt_ReadMore, style: primaryTextStyle(color: gray, size: 12)),
                        16.height,
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}

class ShapesPainter extends CustomPainter {
  Color? color;

  ShapesPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.75);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.height / 1.1, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
