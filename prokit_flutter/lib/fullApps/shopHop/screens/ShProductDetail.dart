import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/percent_indicator/linear_percent_indicator.dart';
import 'package:prokit_flutter/main/utils/rating_bar.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShProduct.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShReview.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';

// ignore: must_be_immutable
class ShProductDetail extends StatefulWidget {
  static String tag = '/ShProductDetail';
  ShProduct? product;

  ShProductDetail({this.product});

  @override
  ShProductDetailState createState() => ShProductDetailState();
}

class ShProductDetailState extends State<ShProductDetail> {
  var position = 0;
  bool isExpanded = false;
  var selectedColor = -1;
  var selectedSize = -1;
  double fiveStar = 0;
  double fourStar = 0;
  double threeStar = 0;
  double twoStar = 0;
  double oneStar = 0;
  List<ShReview> list = [];
  bool autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadProducts();
    setState(() {
      list.clear();
      list.addAll(products);
    });
    setRating();
  }

  Future<List<ShReview>> loadProducts() async {
    String jsonString = await loadContentAsset('assets/shophop_data/reviews.json');
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse as List).map((i) => ShReview.fromJson(i)).toList();
  }

  setRating() {
    fiveStar = 0;
    fourStar = 0;
    threeStar = 0;
    twoStar = 0;
    oneStar = 0;
    list.forEach((review) {
      switch (review.rating) {
        case 5:
          fiveStar++;
          break;
        case 4:
          fourStar++;
          break;
        case 3:
          threeStar++;
          break;
        case 2:
          twoStar++;
          break;
        case 1:
          oneStar++;
          break;
      }
    });
    fiveStar = (fiveStar * 100) / list.length;
    fourStar = (fourStar * 100) / list.length;
    threeStar = (threeStar * 100) / list.length;
    twoStar = (twoStar * 100) / list.length;
    oneStar = (oneStar * 100) / list.length;
    print(fiveStar);
  }

  @override
  void dispose() {
    changeStatusColor(Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    var width = MediaQuery.of(context).size.width;

    var sliderImages = Container(
      height: 380,
      child: PageView.builder(
        itemCount: widget.product!.images!.length,
        itemBuilder: (context, index) {
          return Image.asset("images/shophop/img/products" + widget.product!.images![index].src!, width: width, height: width * 1.05, fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          position = index;
          setState(() {});
        },
      ),
    );

    var productInfo = Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text(widget.product!.name, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeXNormal),
              text(
                widget.product!.on_sale! ? widget.product!.sale_price.toCurrencyFormat() : widget.product!.price.toCurrencyFormat(),
                textColor: sh_colorPrimary,
                fontSize: textSizeXNormal,
                fontFamily: fontMedium,
              )
            ],
          ),
          SizedBox(height: spacing_standard),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(spacing_standard_new)),
                        color: double.parse(widget.product!.average_rating!) < 2
                            ? Colors.red
                            : double.parse(widget.product!.average_rating!) < 4
                                ? Colors.orange
                                : Colors.green,
                      ),
                      child: Row(
                        children: <Widget>[
                          text("3.0", textColor: sh_white),
                          SizedBox(width: spacing_control_half),
                          Icon(Icons.star, color: sh_white, size: 12),
                        ],
                      ),
                    ),
                    SizedBox(width: spacing_standard),
                    text(list.length.toString() + " Reviewer")
                  ],
                ),
              ),
              Text(
                widget.product!.regular_price.toString().toCurrencyFormat()!,
                style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeLargeMedium, decoration: TextDecoration.lineThrough),
              )
            ],
          )
        ],
      ),
    );

    var colorList = [];
    widget.product!.attributes!.forEach((element) {
      if (element.name == 'Color') colorList.addAll(element.options!);
    });

    var colors = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colorList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedColor = index;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.only(right: spacing_xlarge),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: sh_textColorPrimary, width: 0.5), color: getColorFromHex(colorList[index])),
            child: selectedColor == index ? Icon(Icons.done, color: sh_white, size: 12) : Container(),
          ),
        );
      },
    );

    var sizeList = [];
    widget.product!.attributes!.forEach((element) {
      if (element.name == 'Size') sizeList.addAll(element.options!);
    });

    var brandList = [];
    widget.product!.attributes!.forEach((element) {
      if (element.name == 'Brand') brandList.addAll(element.options!);
    });

    var bands = "";
    brandList.forEach((brand) {
      bands = bands + brand.toString() + ", ";
    });

    var sizes = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sizeList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedSize = index;
            setState(() {});
          },
          child: Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: spacing_xlarge),
            decoration: selectedSize == index ? BoxDecoration(shape: BoxShape.circle, border: Border.all(color: sh_textColorPrimary, width: 0.5), color: sh_colorPrimary) : BoxDecoration(),
            child: Center(child: text(sizeList[index], textColor: selectedSize == index ? sh_white : sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium)),
          ),
        );
      },
    );

    var reviews = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: spacing_standard_new),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 1, bottom: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(spacing_standard_new)),
                        color: list[index].rating! < 2
                            ? Colors.red
                            : list[index].rating! < 4
                                ? Colors.orange
                                : Colors.green),
                    child: Row(
                      children: <Widget>[text(list[index].rating.toString(), textColor: sh_white), SizedBox(width: spacing_control_half), Icon(Icons.star, color: sh_white, size: 12)],
                    ),
                  ),
                  SizedBox(width: spacing_standard_new),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(list[index].name, textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                        text(list[index].review, fontSize: textSizeMedium),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: spacing_standard),
              Image.asset("images/shophop/img/products" + widget.product!.images![0].src!, width: 90, height: 110, fit: BoxFit.fill),
              SizedBox(height: spacing_standard),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(right: spacing_standard),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: list[index].verified! ? Colors.green : Colors.grey.withOpacity(0.5)),
                        child: Icon(list[index].verified! ? Icons.done : Icons.clear, color: sh_white, size: 14),
                      ),
                      text(list[index].verified! ? sh_lbl_verified : sh_lbl_not_verified, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeMedium)
                    ],
                  ),
                  text("26 June 2019", fontSize: textSizeMedium)
                ],
              )
            ],
          ),
        );
      },
    );

    var descriptionTab = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(spacing_standard_new),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                text(widget.product!.description, maxLine: 3, isLongText: isExpanded, fontSize: 16.0),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(spacing_control_half),
                    color: sh_white,
                    child: text(isExpanded ? "Read Less" : "Read More", textColor: sh_textColorPrimary, fontSize: textSizeMedium),
                  ),
                  onTap: () {
                    isExpanded = !isExpanded;
                    setState(() {});
                  },
                )
              ],
            ),
            SizedBox(height: spacing_standard_new),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(border: Border.all(color: sh_view_color)),
                    padding: EdgeInsets.only(left: spacing_middle, right: spacing_middle),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: textSizeMedium, color: sh_textColorPrimary),
                            decoration: InputDecoration(border: InputBorder.none, hintText: "Pincode"),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: sh_view_color,
                          margin: EdgeInsets.only(left: spacing_middle, right: spacing_middle),
                        ),
                        text("Check Availability", textColor: sh_textColorPrimary, fontSize: textSizeSmall)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: spacing_standard_new,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[text(sh_lbl_delivered_by, fontSize: textSizeSMedium), text("25 June, Monday", textColor: sh_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium)],
                )
              ],
            ),
            SizedBox(height: spacing_standard_new),
            text(sh_lbl_colors, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
            Container(height: 50, child: colors),
            sizeList.isNotEmpty ? text(sh_lbl_size, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium) : SizedBox(),
            Container(height: 50, child: sizes)
          ],
        ),
      ),
    );
    var moreInfoTab = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: spacing_control, bottom: spacing_control),
                      color: sh_editText_background,
                      child: text(sh_lbl_length, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: spacing_control, bottom: spacing_control, left: spacing_large),
                      color: sh_itemText_background,
                      child: text(widget.product!.dimensions!.length! + " cm", textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard),
                      color: sh_editText_background,
                      child: text(sh_lbl_height, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard, left: spacing_large),
                      color: sh_itemText_background,
                      child: text(widget.product!.dimensions!.height! + " cm", textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard),
                      color: sh_editText_background,
                      child: text(sh_lbl_width, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard, left: spacing_large),
                      color: sh_itemText_background,
                      child: text(widget.product!.dimensions!.width! + " cm", textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard),
                        color: sh_editText_background,
                        child: text(sh_lbl_brand, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard, left: spacing_large),
                        color: sh_itemText_background,
                        child: text(bands, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium, isLongText: true)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    var reviewsTab = SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 60),
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: width * 0.33,
                    width: width * 0.33,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        reviewText("3.0", size: 28.0, fontSize: 30.0, fontFamily: fontBold),
                        text(list.length.toString() + " Reviews", fontSize: textSizeMedium),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: spacing_standard_new,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[reviewText(5), ratingProgress(fiveStar, Colors.green)],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[reviewText(4), ratingProgress(fourStar, Colors.green)],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[reviewText(3), ratingProgress(threeStar, Colors.amber)],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[reviewText(2), ratingProgress(twoStar, Colors.amber)],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[reviewText(1), ratingProgress(oneStar, Colors.red)],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            Divider(
              height: 1,
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(sh_lbl_reviews, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                MaterialButton(
                  textColor: sh_colorPrimary,
                  padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: 0, bottom: 0),
                  child: text(sh_lbl_rate_now, fontSize: textSizeMedium, textColor: sh_colorPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(spacing_large),
                    side: BorderSide(color: sh_colorPrimary),
                  ),
                  onPressed: () {
                    showRatingDialog(context);
                  },
                )
              ],
            ),
            reviews
          ],
        ),
      ),
    );
    var bottomButtons = Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 16, spreadRadius: 2, offset: Offset(3, 1))], color: sh_white),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: text(sh_lbl_add_to_cart, textColor: sh_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
              color: sh_white,
              alignment: Alignment.center,
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              child: text(sh_lbl_buy_now, textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
              color: sh_colorPrimary,
              alignment: Alignment.center,
              height: double.infinity,
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                changeStatusColor(innerBoxIsScrolled ? Colors.white : Colors.transparent);
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 460,
                    floating: false,
                    pinned: true,
                    titleSpacing: 0,
                    backgroundColor: sh_white,
                    iconTheme: IconThemeData(color: sh_textColorPrimary),
                    actionsIconTheme: IconThemeData(color: sh_textColorPrimary),
                    actions: <Widget>[
                      Container(
                        padding: EdgeInsets.all(spacing_standard),
                        margin: EdgeInsets.only(right: spacing_standard_new),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
                        child: Icon(Icons.favorite_border, color: sh_textColorPrimary, size: 18),
                      ),
                      cartIcon(context, 3)
                    ],
                    title: text(innerBoxIsScrolled ? widget.product!.name : "", textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: <Widget>[
                          sliderImages,
                          productInfo,
                        ],
                      ),
                      collapseMode: CollapseMode.pin,
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: sh_colorPrimary,
                        indicatorColor: sh_colorPrimary,
                        unselectedLabelColor: sh_textColorPrimary,
                        tabs: [
                          Tab(text: sh_lbl_description),
                          Tab(text: sh_lbl_tab_more_info),
                          Tab(text: sh_lbl_reviews),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  descriptionTab,
                  moreInfoTab,
                  reviewsTab,
                ],
              ),
            ),
          ),
          bottomButtons
        ],
      ),
    );
  }

  Widget reviewText(rating, {size = 15.0, fontSize = textSizeLargeMedium, fontFamily = fontMedium, textColor = sh_textColorPrimary}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text(rating.toString(), textColor: textColor, fontFamily: fontFamily, fontSize: fontSize),
        SizedBox(width: spacing_control),
        Icon(Icons.star, color: Colors.amber, size: size)
      ],
    );
  }

  Widget ratingProgress(value, color) {
    return Expanded(
      child: LinearPercentIndicator(
        lineHeight: 10.0,
        percent: value / 100,
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: Colors.grey.withOpacity(0.2),
        progressColor: color,
      ),
    );
  }

  void showRatingDialog(BuildContext context) {
    showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: boxDecoration(bgColor: sh_white, showShadow: false, radius: spacing_middle),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: text("Review", fontSize: 24.0, fontFamily: fontBold, textColor: sh_textColorPrimary),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(spacing_large),
                          child: RatingBar(
                            onRatingChanged: (v) {},
                            initialRating: 0.0,
                            emptyIcon: Icon(Icons.star).icon!,
                            filledIcon: Icon(Icons.star).icon!,
                            filledColor: Colors.amber,
                            emptyColor: Colors.grey.withOpacity(0.5),
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: spacing_large, right: spacing_large),
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              validator: (value) {
                                return value!.isEmpty ? "Review Filed Required!" : null;
                              },
                              style: TextStyle(fontFamily: fontRegular, fontSize: textSizeNormal, color: sh_textColorPrimary),
                              decoration: new InputDecoration(
                                hintText: 'Describe your experience',
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1),
                                ),
                                filled: false,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(spacing_large),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: MaterialButton(
                                  textColor: sh_colorPrimary,
                                  child: text(sh_lbl_cancel, fontSize: textSizeNormal, textColor: sh_colorPrimary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                    side: BorderSide(color: sh_colorPrimary),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(ConfirmAction.CANCEL);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: spacing_standard_new,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  color: sh_colorPrimary,
                                  textColor: Colors.white,
                                  child: text(sh_lbl_submit, fontSize: textSizeNormal, textColor: sh_white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                  onPressed: () {
                                    final form = _formKey.currentState!;
                                    if (form.validate()) {
                                      form.save();
                                    } else {
                                      setState(() => autoValidate = true);
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: sh_white,
      child: Container(child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
