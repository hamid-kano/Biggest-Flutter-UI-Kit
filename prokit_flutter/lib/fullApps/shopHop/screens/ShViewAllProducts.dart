import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShAttribute.dart';
import 'package:prokit_flutter/fullApps/shopHop/models/ShProduct.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShExtension.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'ShProductDetail.dart';

// ignore: must_be_immutable
class ShViewAllProductScreen extends StatefulWidget {
  static String tag = '/ViewAllProductScreen';

  List<ShProduct>? prodcuts;
  var title;

  ShViewAllProductScreen({this.prodcuts, this.title});

  @override
  ShViewAllProductScreenState createState() {
    return ShViewAllProductScreenState();
  }
}

class ShViewAllProductScreenState extends State<ShViewAllProductScreen> {
  var sortType = -1;
  List<ShProduct> mProductModel = [];
  ShAttributes? mProductAttributeModel;

  var isListViewSelected = false;
  var errorMsg = '';
  var scrollController = new ScrollController();
  bool isLoading = false;
  bool isLoadingMoreData = false;
  int page = 1;
  bool isLastPage = false;
  var primaryColor;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var model = await loadAttributes();
    setState(() {
      mProductAttributeModel = model;
      mProductModel.addAll(widget.prodcuts!);
    });
  }

  void onListClick(which) {
    setState(() {
      if (which == 1) {
        isListViewSelected = true;
      } else if (which == 2) {
        isListViewSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final listView = Container(
      child: ListView.builder(
        itemCount: mProductModel.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShProductDetail(product: mProductModel[index])));
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
                      child: Image.asset("images/shophop/img/products" + mProductModel[index].images![0].src!, fit: BoxFit.cover, height: width * 0.35, width: width * 0.29),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(mProductModel[index].name, textColor: sh_textColorPrimary),
                          SizedBox(height: 4),
                          Row(
                            children: <Widget>[
                              text(mProductModel[index].on_sale! ? mProductModel[index].sale_price.toString().toCurrencyFormat() : mProductModel[index].price.toString().toCurrencyFormat(),
                                  textColor: sh_colorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                              SizedBox(
                                width: spacing_control,
                              ),
                              Text(
                                mProductModel[index].regular_price.toString().toCurrencyFormat()!,
                                style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeSmall, decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: spacing_standard,
                          ),
                          Row(children: colorWidget(mProductModel[index].attributes!)),
                          SizedBox(height: 4),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RatingBar(
                                    initialRating: double.parse(mProductModel[index].average_rating!),
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
      ),
    );

    final gridView = Container(
      child: GridView.builder(
          itemCount: mProductModel.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(spacing_middle),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 9 / 14, crossAxisSpacing: spacing_middle, mainAxisSpacing: spacing_standard_new),
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShProductDetail(product: mProductModel[index])));
              },
              child: Container(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 9 / 11,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(border: Border.all(color: sh_view_color, width: 0.5)),
                            child: Image.asset(
                              "images/shophop/img/products" + mProductModel[index].images![0].src!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(spacing_control),
                            margin: EdgeInsets.all(spacing_standard),
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
                    SizedBox(height: 2),
                    Row(
                      children: <Widget>[
                        text(mProductModel[index].on_sale! ? mProductModel[index].sale_price.toString().toCurrencyFormat() : mProductModel[index].price.toString().toCurrencyFormat(),
                            textColor: sh_colorPrimary, fontFamily: fontMedium, fontSize: textSizeNormal),
                        SizedBox(
                          width: spacing_control,
                        ),
                        Text(
                          mProductModel[index].regular_price.toString().toCurrencyFormat()!,
                          style: TextStyle(color: sh_textColorSecondary, fontFamily: fontRegular, fontSize: textSizeSMedium, decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing_middle),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, top: spacing_middle),
                      child: Row(children: colorWidget(mProductModel[index].attributes!)),
                    )
                  ],
                ),
              ),
            );
          }),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: text(widget.title, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: sh_textColorPrimary),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () => showMyBottomSheet(context)),
          IconButton(
              icon: Icon(
                isListViewSelected ? Icons.view_list : Icons.border_all,
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  isListViewSelected = !isListViewSelected;
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            errorMsg.isEmpty
                ? Center(
                    child: mProductModel.isNotEmpty
                        ? Column(children: <Widget>[isListViewSelected ? listView : gridView, CircularProgressIndicator().visible(isLoadingMoreData)])
                        : CircularProgressIndicator().paddingAll(8),
                  )
                : Center(child: Text(errorMsg)),
          ],
        ),
      ),
    );
  }

  void showMyBottomSheet(context) {
    if (mProductModel.isEmpty) return;
    void onSave(List<int> category, List<String> size, List<String> color, List<String> brand) {
      Map request = {
        'category': category.toSet().toList(),
        'size': size.toSet().toList(),
        'color': color.toSet().toList(),
        'brand': brand.toSet().toList(),
      };
      if (category.length < 1) request.remove('category');
      if (size.length < 1) request.remove('size');
      if (color.length < 1) request.remove('color');
      if (brand.length < 1) request.remove('brand');
    }

    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return FilterBottomSheetLayout(mProductAttributeModel: mProductAttributeModel, onSave: onSave);
        },
        fullscreenDialog: true));
  }

  List<Widget> sizeWidget(List<String> size) {
    var maxWidget = 5;
    var currentIndex = 0;
    List<Widget> list = [];
    var totalSize = size.length;
    var flag = false;

    size.forEach((size) {
      if (currentIndex < maxWidget) {
        list.add(Container(
          margin: EdgeInsets.only(right: spacing_middle),
          child: Center(child: text(size.trim(), fontSize: textSizeMedium, textColor: sh_textColorPrimary, fontFamily: fontMedium)),
        ));
        currentIndex++;
      } else {
        if (!flag) list.add(Text('+ ${totalSize - maxWidget} more'));
        flag = true;
        return;
      }
    });
    return list;
  }
}

// ignore: must_be_immutable
class FilterBottomSheetLayout extends StatefulWidget {
  ShAttributes? mProductAttributeModel;
  var onSave;

  FilterBottomSheetLayout({Key? key, this.mProductAttributeModel, this.onSave}) : super(key: key);

  @override
  FilterBottomSheetLayoutState createState() {
    return FilterBottomSheetLayoutState();
  }
}

class FilterBottomSheetLayoutState extends State<FilterBottomSheetLayout> {
  List<int> selectedCategories = [];
  List<String> selectedColors = [];
  List<String> selectedSizes = [];
  List<String> selectedBrands = [];

  @override
  Widget build(BuildContext context) {
    var categoryList = widget.mProductAttributeModel!.categories;
    var colorsList = widget.mProductAttributeModel!.color;
    var sizesList = widget.mProductAttributeModel!.size;
    var brandsList = widget.mProductAttributeModel!.brand;
    final productCategoryListView = ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryList?.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: text(categoryList![index].name, textColor: categoryList[index].isSelected! ? Colors.red : blackColor),
              selected: categoryList[index].isSelected!,
              onSelected: (selected) {
                setState(() {
                  categoryList[index].isSelected! ? categoryList[index].isSelected = false : categoryList[index].isSelected = true;
                });
              },
              elevation: 2,
              backgroundColor: Colors.white10,
              selectedColor: sh_colorPrimary.withOpacity(0.5),
            ),
          );
        });

    final productColorsListView = ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colorsList?.length,
        padding: EdgeInsets.only(left: spacing_standard_new),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  colorsList![index].isSelected ? colorsList[index].isSelected = false : colorsList[index].isSelected = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.only(right: spacing_standard_new),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: sh_textColorPrimary, width: 0.5), color: getColorFromHex(colorsList![index].name!)),
                child: colorsList[index].isSelected
                    ? Icon(
                        Icons.done,
                        color: sh_white,
                        size: 12,
                      )
                    : Container(),
              ),
            ),
          );
        });

    final productSizeListView = ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: sizesList?.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: text(sizesList![index].name, textColor: categoryList![index].isSelected! ? Colors.red : blackColor),
              selected: sizesList[index].isSelected,
              onSelected: (selected) {
                setState(() {
                  sizesList[index].isSelected ? sizesList[index].isSelected = false : sizesList[index].isSelected = true;
                });
              },
              elevation: 2,
              backgroundColor: Colors.white10,
              selectedColor: sh_colorPrimary.withOpacity(0.5),
            ),
          );
        });

    final productBrandsListView = ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: brandsList?.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: text(brandsList![index].name, textColor: brandsList[index].isSelected ? Colors.red : blackColor),
              selected: brandsList[index].isSelected,
              onSelected: (selected) {
                setState(() {
                  brandsList[index].isSelected ? brandsList[index].isSelected = false : brandsList[index].isSelected = true;
                });
              },
              elevation: 2,
              backgroundColor: Colors.white10,
              selectedColor: sh_colorPrimary.withOpacity(0.5),
            ),
          );
        });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_colorPrimary,
        title: text(sh_lbl_filter, textColor: sh_white, fontSize: textSizeNormal, fontFamily: fontMedium),
        iconTheme: IconThemeData(color: sh_white),
        actions: <Widget>[
          InkWell(
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: spacing_middle),
                  child: text(sh_lbl_apply, textColor: sh_white, fontFamily: fontMedium, fontSize: textSizeLargeMedium)),
              onTap: () {
                finish(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: spacing_standard_new, top: spacing_standard_new),
              child: text(sh_lbl_categories, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
            ),
            SizedBox(height: 10),
            Container(child: productCategoryListView, height: 50),
            Padding(
              padding: EdgeInsets.only(left: spacing_standard_new, top: spacing_standard_new),
              child: text(sh_lbl_colors, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
            ),
            SizedBox(height: 10),
            Container(child: productColorsListView, height: 50),
            Padding(
              padding: EdgeInsets.only(left: spacing_standard_new, top: spacing_standard_new),
              child: text(sh_lbl_size, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
            ),
            SizedBox(height: 10),
            Container(child: productSizeListView, height: 50),
            Padding(
              padding: EdgeInsets.only(left: spacing_standard_new, top: spacing_standard_new),
              child: text(sh_lbl_brands, textColor: sh_textColorPrimary, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
            ),
            SizedBox(height: 10),
            Container(child: productBrandsListView, height: 50)
          ],
        ),
      ),
    );
  }
}
