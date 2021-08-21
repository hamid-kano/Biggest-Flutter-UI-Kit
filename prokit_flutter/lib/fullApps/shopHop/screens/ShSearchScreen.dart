import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShProduct.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'ShProductDetail.dart';

class ShSearchScreen extends StatefulWidget {
  static String tag = '/ShSearchScreen';

  @override
  ShSearchScreenState createState() => ShSearchScreenState();
}

class ShSearchScreenState extends State<ShSearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<ShProduct> list = [];
  bool isLoadingMoreData = false;
  bool isEmpty = false;
  var searchText = "";

  @override
  void initState() {
    super.initState();
  }

  fetchData() async {
    List<ShProduct> porducts = await loadProducts();
    List<ShProduct> filteredList = [];
    porducts.forEach((product) {
      if (product.name!.contains(searchText)) {
        filteredList.add(product);
      }
    });
    setState(() {
      list.clear();
      list.addAll(filteredList);
      isEmpty = list.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var searchList = ListView.builder(
      itemCount: list.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShProductDetail(product: list[index])));
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 1)),
                    child: Image.asset("images/shophop/img/products" + list[index].images![0].src!, fit: BoxFit.cover, height: width * 0.35, width: width * 0.29),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(list[index].name, textColor: sh_textColorPrimary),
                        SizedBox(height: 4),
                        Row(
                          children: <Widget>[
                            text(list[index].on_sale! ? list[index].sale_price.toString().toCurrencyFormat() : list[index].price.toString().toCurrencyFormat(),
                                textColor: sh_colorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                            SizedBox(
                              width: spacing_control,
                            ),
                            Text(
                              list[index].regular_price.toString().toCurrencyFormat()!,
                              style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeSmall, decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: spacing_standard,
                        ),
                        Row(children: colorWidget(list[index].attributes!)),
                        SizedBox(height: 4),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RatingBar(
                                  initialRating: double.parse(list[index].average_rating!),
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  tapOnlyMode: true,
                                  itemCount: 5,
                                  itemSize: 16,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                Container(
                                  padding: EdgeInsets.all(spacing_control),
                                  margin: EdgeInsets.only(right: spacing_standard),
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: sh_white),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: sh_textColorPrimary,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_textColorPrimary),
        title: TextFormField(
          onFieldSubmitted: (value) {
            setState(() {
              searchText = value;
              isEmpty = false;
              isLoadingMoreData = true;
            });
            fetchData();
          },
          controller: searchController,
          textInputAction: TextInputAction.search,
          style: TextStyle(fontSize: textSizeMedium, color: sh_textColorPrimary),
          decoration: InputDecoration(border: InputBorder.none, hintText: "Search"),
          keyboardType: TextInputType.text,
          textAlign: TextAlign.start,
        ),
        actions: <Widget>[
          searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: sh_textColorPrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      list.clear();
                      isEmpty = false;
                      isLoadingMoreData = false;
                    });
                  },
                )
              : Container()
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: !isEmpty
            ? isLoadingMoreData
                ? Column(
                    children: <Widget>[searchList, loadingWidgetMaker()],
                  )
                : searchList
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    text("No results found for \"" + searchController.text + "\"", textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLarge),
                    text("Try a diffetent keyword", fontFamily: fontMedium, fontSize: textSizeMedium)
                  ],
                ),
              ),
      ),
    );
  }
}
