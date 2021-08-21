import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/dots_indicator/dots_indicator.dart';
import 'package:prokit_flutter/themes/theme12/models/T12Models.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_data_generator.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_widget.dart';

import '../../../main.dart';

class T12Dashboard extends StatefulWidget {
  static String tag = '/T12Dashboard';

  @override
  T12DashboardState createState() => T12DashboardState();
}

class T12DashboardState extends State<T12Dashboard> {
   ScrollController? controller;

  List<T12Slider> mSliderList = [];
  List<T12Category> mCategoryList = [];
  List<T12Transactions> mTransactionList = [];
  int currentPage = 0;
   double offset = 0.0 ;


   @override
  void initState() {
    super.initState();
    mSliderList.addAll(getCards());
    mCategoryList.addAll(getCategories());
    mTransactionList.addAll(getTransactions());
    controller = ScrollController();
    controller!.addListener((){
      setState(() {
        offset = controller!.offset;
      });
    });
    super.initState();
  }
  /* _scrollListener() {
     if (controller!.offset >= controller!.position.maxScrollExtent &&
         !controller!.position.outOfRange) {
       setState(() {
         var message = "reach the bottom";
       });
     }
     if (controller!.offset <= controller!.position.minScrollExtent &&
         !controller!.position.outOfRange) {
       setState(() {
         var message = "reach the top";
       });
     }
   }*/
   @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var categoryWidth = (width - 56) / 4;
    var sliderHeight = height * 0.3;

    var slider = Container(
      height: sliderHeight,
      margin: EdgeInsets.only(top: 76),
      color: appStore.scaffoldBackground,
      child: Column(
        children: <Widget>[
          Expanded(
            child: T12SliderWidget(mSliderList, (page) {
              setState(() {
                currentPage = page;
              });
            }),
          ),
          SizedBox(height: 16),
          DotsIndicator(
            dotsCount: mSliderList.length,
            position: currentPage,
            decorator: DotsDecorator(color: t12_text_secondary.withOpacity(0.15), activeColor: t12_primary_color, activeSize: Size.square(spacing_middle), spacing: EdgeInsets.all(3)),
          )
        ],
      ),
    );
    var category = Container(
      alignment: Alignment.center,
      height: categoryWidth,
      margin: EdgeInsets.only(top: spacing_standard_new),
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: mCategoryList.length,
        padding: EdgeInsets.only(left: spacing_standard, right: spacing_standard_new),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: categoryWidth,
            margin: EdgeInsets.only(left: spacing_standard),
            decoration: boxDecoration(bgColor: mCategoryList[index].color!.withOpacity(0.2), radius: spacing_standard),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  mCategoryList[index].icon!,
                  width: categoryWidth * 0.4,
                  height: categoryWidth * 0.4,
                  color: mCategoryList[index].color,
                ),
                text(mCategoryList[index].name, fontSize: textSizeSMedium, textColor: appStore.textSecondaryColor).paddingTop(spacing_control_half)
              ],
            ),
          );
        },
      ),
    );
    var transaction = ListView.builder(
      controller: controller,
      scrollDirection: Axis.vertical,
      itemCount: mTransactionList.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return transactionWidget(mTransactionList[index], categoryWidth);
      },
    );

    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: sliderHeight + 70,
                floating: true,
                backgroundColor: Colors.white,
                pinned: true,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                actionsIconTheme: IconThemeData(opacity: 0.0, color: t12_text_color_primary),
                title: Container(
                  height: 60,
                  padding: EdgeInsets.only(left: spacing_standard_new),
                  color: appStore.scaffoldBackground,
                  child: Row(
                    children: <Widget>[
                      Image.asset(t12_profile, width: 35, height: 35).cornerRadiusWithClipRRect(spacing_standard),
                      Expanded(child: toolBarTitle("My Wallet", textColor: appStore.textPrimaryColor).paddingLeft(spacing_standard_new)),
                      Row(
                        children: <Widget>[
                          Icon(Icons.search, color: appStore.iconColor, size: 24).paddingAll(spacing_standard).onTap(() {}),
                          Icon(Icons.more_vert, color: appStore.iconColor, size: 24).paddingAll(spacing_standard).onTap(() {})
                        ],
                      )
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: slider,
                )),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              category,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  headingText("Transactions"),
                  text(
                    "See all",
                    textColor: t12_primary_color,
                    fontFamily: fontMedium,
                    fontSize: textSizeMedium,
                  ).onTap(() {}),
                ],
              ).paddingAll(spacing_standard_new),
              transaction
            ],
          ),
        ),
      ),
    );
  }
}
