import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/model/db2/Db2Model.dart';
import 'package:prokit_flutter/dashboard/utils/DbColors.dart';
import 'package:prokit_flutter/dashboard/utils/DbDataGenerator.dart';
import 'package:prokit_flutter/dashboard/utils/DbImages.dart';
import 'package:prokit_flutter/dashboard/utils/DbStrings.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class Dashboard2 extends StatefulWidget {
  static String tag = '/Dashboard2';

  @override
  Dashboard2State createState() => Dashboard2State();
}

const CURVE_HEIGHT = 100.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.8;

class Dashboard2State extends State<Dashboard2> {
  late List<Db2ShopModel> mListings;
  late List<Db2ShopModel> mListings1;
  late List<Db2ShopModel> mListings2;

  @override
  void initState() {
    super.initState();
    mListings = db2getCategory();
    mListings1 = db2getFeatured();
    mListings2 = db2getProduct();
  }

  @override
  Widget build(BuildContext context) {
    Widget db2Label(var text) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text, style: primaryTextStyle(size: 20, color: db2_textColorPrimary, fontFamily: fontMedium)),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: db2_lbl_view_all, style: primaryTextStyle(size: 14, color: db2_textColorSecondary)),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: db2_textColorSecondary,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    changeStatusColor(db2_colorSecondary);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 140,
                  child: CustomPaint(painter: _MyPainter()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.menu, color: white),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          Text(
                            db2_lbl_home,
                            style: boldTextStyle(size: 20, color: white),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.favorite, color: white),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart, color: white),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  transform: Matrix4.translationValues(0.0, 60.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.all(Radius.circular(26)), boxShadow: defaultBoxShadow()),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: white,
                                  hintText: db2_lbl_search_here,
                                  contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, right: 50.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: white, width: 0.5),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: white, width: 0.5),
                                    borderRadius: BorderRadius.circular(26),
                                  ))),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(Icons.search, color: db2_textColorSecondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    db2Label("Categories"),
                    SizedBox(
                      height: 105,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Db2Category(mListings[index], index);
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 16),
                      child: Text(
                        db2_lbl_offers,
                        style: primaryTextStyle(size: 20, fontFamily: fontMedium),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 16, left: 16),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.38,
                      child: PageView(
                        children: <Widget>[
                          Db2Slider(file: b1),
                          Db2Slider(file: b2),
                          Db2Slider(file: b3),
                          Db2Slider(file: b4),
                          Db2Slider(file: b5),
                          Db2Slider(file: b6),
                        ],
                      ),
                    ),
                    db2Label(db2_lbl_hot_product),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings1.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Db2Product(mListings1[index], index);
                          }),
                    ),
                    db2Label(db2_lbl_Featured),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings2.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Db2Product(mListings2[index], index);
                          }),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Db2Category extends StatelessWidget {
  late Db2ShopModel model;

  Db2Category(Db2ShopModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.cover, height: 75, width: 75),
          ),
          SizedBox(height: 4),
          Text(model.name, style: primaryTextStyle())
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Db2Product extends StatelessWidget {
  late Db2ShopModel model;

  Db2Product(Db2ShopModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.cover, height: 170, width: MediaQuery.of(context).size.width),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name),
                Text(
                  "\$100",
                  style: primaryTextStyle(color: db2_textColorSecondary, fontFamily: fontMedium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Db2Slider extends StatelessWidget {
  final String file;

  Db2Slider({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Image.asset(file, fit: BoxFit.fill),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = db2_colorSecondary;

    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
