import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import 'BHPackageOffersScreen.dart';

class BHDetailScreen extends StatefulWidget {
  static String tag = '/NewSliverCustom';

  @override
  BHDetailScreenState createState() => BHDetailScreenState();
}

class BHDetailScreenState extends State<BHDetailScreen> with SingleTickerProviderStateMixin {
  int? _radioValue1 = 0;
  TabController? controller;

  late List<BHGalleryModel> galleryList;
  late List<BHCategoryModel> categoryList;
  late List<BHOfferModel> offerList;
  late List<BHServicesModel> servicesList;
  late List<BHReviewModel> reviewList;
  late List<BHHairStyleModel> hairStyleList;
  late List<BHMakeUpModel> makeupList;

  @override
  void initState() {
    super.initState();
    galleryList = getGalleryList();
    categoryList = getCategory();
    offerList = getOfferList();
    servicesList = getServicesList();
    reviewList = getReviewList();
    hairStyleList = getHairStyleList();
    makeupList = getMakeupList();
  }

  void something(int? value) {
    setState(() {
      _radioValue1 = value;
      print(_radioValue1);
    });
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    Widget aboutWidget() {
      return Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BHTxtInformation,
                      style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Text(BHDetailTitle, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BHTxtContact,
                      style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.call, size: 16),
                        8.width,
                        Text('+1(325)1256 7592', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.web, size: 16),
                        8.width,
                        Text('www.salon.com', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BHTxtOpeningTime,
                      style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Monday - Friday', style: TextStyle(color: BHGreyColor, fontSize: 14)),
                        Column(
                          children: [
                            Text('7:30 - 11:30 AM', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                            8.height,
                            Text('7:30 - 11:30 AM', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14))
                          ],
                        )
                      ],
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sunday', style: TextStyle(color: BHGreyColor, fontSize: 14)),
                        Text('7:30 - 11:30 AM', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      BHTxtAddress,
                      style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    8.width,
                    Text('301 Dorthy walks,chicago,Us.', style: TextStyle(color: BHColorPrimary, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget galleryWidget() {
      return StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: galleryList.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image.asset(galleryList[index].img!, fit: BoxFit.cover),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      );
    }

    Widget serviceWidget() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset(categoryList[index].img!, height: 40, width: 40),
                        8.height,
                        Text(categoryList[index].categoryName!, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14))
                      ],
                    ),
                  );
                },
              ),
            ),
            // 8.height,
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(BHTxtPackageOffers, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: BHAppTextColorPrimary)),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: offerList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 220,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      shadowColor: BHGreyColor.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: commonCacheImageWidget(offerList[index].img, 100, width: 250, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(offerList[index].offerName!, style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(offerList[index].offerDate!, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14), textAlign: TextAlign.left),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('\$${offerList[index].offerOldPrice}', style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14, decoration: TextDecoration.lineThrough)),
                                    8.width,
                                    Text('\$${offerList[index].offerNewPrice}', style: TextStyle(color: BHColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Text(BHTxtPopularServices, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: BHAppTextColorPrimary)),
            ),
            ListView.builder(
              itemCount: servicesList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        child: commonCacheImageWidget(servicesList[index].img, 80, width: 80, fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(servicesList[index].serviceName!, style: TextStyle(fontWeight: FontWeight.bold, color: BHAppTextColorPrimary, fontSize: 14)),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(servicesList[index].time!, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                              8.width,
                              Text('\$${servicesList[index].price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: BHColorPrimary)),
                            ],
                          ),
                        ],
                      ).expand(),
                      Radio(
                        value: servicesList[index].radioVal,
                        groupValue: _radioValue1,
                        activeColor: BHColorPrimary,
                        onChanged: (dynamic value) => something(value),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  BHPackageOffersScreen().launch(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  primary: BHColorPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                child: Text(BHBtnBookAppointment, style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      );
    }

    Widget reviewWidget() {
      return Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
                ),
                child: Column(
                  children: [
                    Text(
                      BHTxtReview,
                      style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
                    ),
                    8.height,
                    Text(BHTxtReviewMsg, style: TextStyle(fontSize: 14, color: BHGreyColor)),
                    8.height,
                    RatingBar(
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      initialRating: 1.5,
                      glow: true,
                      glowColor: BHGreyColor,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      allowHalfRating: true,
                      minRating: 1,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => Icon(Icons.star, color: BHColorPrimary),
                    ),
                    8.height,
                    Row(
                      children: [
                        Container(
                          height: 45,
                          alignment: Alignment.center,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Say something...',
                              hintStyle: TextStyle(color: BHGreyColor),
                              filled: true,
                              fillColor: BHGreyColor.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                            ),
                          ),
                        ).expand(),
                        8.width,
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: BHColorPrimary,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: reviewList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 0),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: BHGreyColor.withOpacity(0.3),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundImage: AssetImage(reviewList[index].img!), radius: 30),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(reviewList[index].name!, style: TextStyle(fontSize: 16, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold)),
                                Text(reviewList[index].day!, style: TextStyle(fontSize: 12, color: BHGreyColor, fontWeight: FontWeight.bold)),
                              ],
                            ).expand(),
                            Row(
                              children: [
                                Text(reviewList[index].rating.toString(), style: TextStyle(color: BHAppTextColorSecondary, fontSize: 12)),
                                8.width,
                                Icon(Icons.star, color: BHColorPrimary),
                              ],
                            ),
                          ],
                        ),
                        8.height,
                        Text(reviewList[index].review!, style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget specialListsWidget() {
      return Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(BHTxtHairStyle, style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                height: 180,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: hairStyleList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                      shadowColor: BHGreyColor.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: commonCacheImageWidget(hairStyleList[index].img, 110, width: 120, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              hairStyleList[index].name!,
                              style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(BHTxtMakeupArtist, style: TextStyle(color: BHAppTextColorPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                height: 180,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: makeupList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                      shadowColor: BHGreyColor.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: commonCacheImageWidget(hairStyleList[index].img, 110, width: 120, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              makeupList[index].name!,
                              style: TextStyle(fontSize: 14, color: BHAppTextColorSecondary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              Container(
                child: SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: white),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                  backgroundColor: BHColorPrimary,
                  pinned: true,
                  elevation: 2,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    titlePadding: EdgeInsets.all(10),
                    background: Stack(
                      children: [
                        Image.asset(
                          BHDashedBoardImage6,
                          height: 500,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 35),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Marguerite Cross',
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5',
                                        style: TextStyle(color: whiteColor, fontSize: 16),
                                      ),
                                      IconButton(icon: Icon(Icons.star, color: BHColorPrimary), onPressed: () {})
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Day Salon', style: TextStyle(color: whiteColor, fontSize: 16), textAlign: TextAlign.left),
                                  Container(
                                    height: 25,
                                    width: 65,
                                    margin: EdgeInsets.only(right: 16),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(BHBtnOpen, style: TextStyle(color: whiteColor, fontSize: 14)),
                                      style: TextButton.styleFrom(
                                        primary: BHColorPrimary,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    centerTitle: true,
                  ),
                  bottom: TabBar(
                    labelColor: whiteColor,
                    unselectedLabelColor: whiteColor,
                    isScrollable: true,
                    indicatorColor: BHColorPrimary,
                    tabs: [
                      Tab(
                        child: Align(alignment: Alignment.center, child: Text(BHTabAbout, style: TextStyle(fontSize: 14))),
                      ),
                      Tab(
                        child: Align(alignment: Alignment.center, child: Text(BHTabGallery, style: TextStyle(fontSize: 14))),
                      ),
                      Tab(
                        child: Align(alignment: Alignment.center, child: Text(BHTabServices, style: TextStyle(fontSize: 14))),
                      ),
                      Tab(
                        child: Align(alignment: Alignment.center, child: Text(BHTabReview, style: TextStyle(fontSize: 14))),
                      ),
                      Tab(
                        child: Align(alignment: Alignment.center, child: Text(BHTabSalonSpecialList, style: TextStyle(fontSize: 14))),
                      ),
                    ],
                    controller: controller,
                  ),
                  actions: [
                    IconButton(icon: Icon(Icons.call, color: whiteColor, size: 16), onPressed: () {}),
                    IconButton(icon: Icon(Icons.message, color: whiteColor, size: 16), onPressed: () {}),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              aboutWidget(),
              galleryWidget(),
              serviceWidget(),
              reviewWidget(),
              specialListsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
