import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTFilter.dart';
import 'package:prokit_flutter/defaultTheme/model/DTFilterOption.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'DTDrawerWidget.dart';

int selectedIndex = 0;

class DTFilterScreen extends StatefulWidget {
  static String tag = '/DTFilterScreen';

  @override
  DTFilterScreenState createState() => DTFilterScreenState();
}

class DTFilterScreenState extends State<DTFilterScreen> {
  List<int> totalSelectedIndex = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    selectedIndex = 0;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Filter'),
        drawer: DTDrawerWidget(),
        bottomNavigationBar: Container(
          width: dynamicWidth(context),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.bottomCenter,
          height: 80,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("2", style: primaryTextStyle()),
                  Text("products found", style: secondaryTextStyle()),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  toast("Apply");
                },
                style: ElevatedButton.styleFrom(
                  primary: appColorPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.fromLTRB(50, 12, 50, 12),
                ),
                child: Text("Apply", style: primaryTextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: isMobile ? 3 : 2,
              child: Container(
                color: appStore.appBarColor,
                height: context.height(),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dataList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 16),
                  itemBuilder: (context, index) {
                    var selectedCount = 0;

                    getCurrentList(index).forEach((element) {
                      if (element.isSelected) selectedCount++;
                    });
                    dataList[index].total = selectedCount;

                    return Container(
                      color: selectedIndex == index ? appStore.appBarColor : Colors.transparent,
                      padding: EdgeInsets.fromLTRB(16, 16, 10, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              dataList[index].name!,
                              style: primaryTextStyle(color: selectedIndex == index ? appColorPrimary : appStore.textPrimaryColor),
                              maxLines: 1,
                            ),
                          ),
                          selectedIndex == index
                              ? Icon(Icons.check, color: appColorPrimary, size: 16)
                              : Text(dataList[index].total.validate().toString(), style: primaryTextStyle(color: appColorPrimary), maxLines: 1)
                        ],
                      ),
                    ).onTap(() {
                      setState(() {
                        selectedIndex = index;

                        setState(() {});
                      });
                    });
                  },
                ),
              ),
            ),
            VerticalDivider(width: 0),
            Expanded(flex: isMobile ? 5 : 7, child: Container(height: context.height(), child: data(selectedIndex))),
          ],
        ),
      ),
    );
  }
}

List<DTFilterOptionModel> getCurrentList(int pos) {
  if (pos == 0) return mPrice;
  if (pos == 1) return mBrand;
  if (pos == 2) return mRating;
  if (pos == 3) return mOffers;
  if (pos == 4) return mDiscount;
  if (pos == 5) return mAvailability;

  return <DTFilterOptionModel>[];
}

Widget data(int pos, {int? selectedItemCount}) {
  if (pos == 0) return mOption(mPrice);
  if (pos == 1) return mOption(mBrand);
  if (pos == 2) return mOption(mRating);
  if (pos == 3) return mOption(mOffers);
  if (pos == 4) return mOption(mDiscount);
  if (pos == 5) return mOption(mAvailability);
  return SizedBox();
}

Widget mOption(List<DTFilterOptionModel> mList) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: mList.length,
    shrinkWrap: true,
    padding: EdgeInsets.only(bottom: 16),
    itemBuilder: (context, index) {
      return Option(mList[index]);
    },
  );
}

// ignore: must_be_immutable
class Option extends StatefulWidget {
  DTFilterOptionModel model;

  Option(this.model);

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: <Widget>[
          Container(
            width: 16,
            height: 16,
            decoration: boxDecoration(
              bgColor: appStore.appBarColor,
              color: Theme.of(context).dividerColor,
            ),
            child: Icon(Icons.done, color: appStore.iconColor, size: 12).visible(widget.model.isSelected),
          ),
          16.width,
          Text(
            widget.model.name!,
            style: primaryTextStyle(
              color: widget.model.isSelected ? appColorPrimary : appStore.textPrimaryColor,
            ),
          ).expand(),
        ],
      ),
    ).onTap(() {
      setState(() {
        widget.model.isSelected = !widget.model.isSelected;
      });
    });
  }
}

List<DTFilterModel> dataList = [
  DTFilterModel(name: 'Price', total: 0, tag: mOption(mPrice)),
  DTFilterModel(name: 'Brand', total: 0, tag: mOption(mBrand)),
  DTFilterModel(name: 'Ratings', total: 0, tag: mOption(mRating)),
  DTFilterModel(name: 'Offers', total: 0, tag: mOption(mOffers)),
  DTFilterModel(name: 'Discount', total: 0, tag: mOption(mDiscount)),
  DTFilterModel(name: 'Availability', total: 0, tag: mOption(mAvailability)),
];

List<DTFilterOptionModel> mPrice = [
  DTFilterOptionModel(name: 'Rs. 7000 - Rs.9999'),
  DTFilterOptionModel(name: 'Rs. 2000 and Below'),
  DTFilterOptionModel(name: 'Rs. 2001 - Rs.3999'),
];

List<DTFilterOptionModel> mBrand = [
  DTFilterOptionModel(name: 'Zara'),
  DTFilterOptionModel(name: 'Holister'),
  DTFilterOptionModel(name: 'Nike'),
  DTFilterOptionModel(name: 'Burbary'),
  DTFilterOptionModel(name: 'Chanel'),
  DTFilterOptionModel(name: 'Gussi'),
  DTFilterOptionModel(name: 'Max'),
  DTFilterOptionModel(name: 'Puma'),
];
List<DTFilterOptionModel> mRating = [
  DTFilterOptionModel(name: '4 &above'),
  DTFilterOptionModel(name: '3 &above'),
  DTFilterOptionModel(name: '2 &above'),
  DTFilterOptionModel(name: '1 &above'),
];
List<DTFilterOptionModel> mOffers = [
  DTFilterOptionModel(name: 'Bank Offer'),
  DTFilterOptionModel(name: 'Buy more, Save more'),
  DTFilterOptionModel(name: 'No Cost EMI'),
  DTFilterOptionModel(name: 'Special Price'),
];

List<DTFilterOptionModel> mDiscount = [
  DTFilterOptionModel(name: '60% or more'),
  DTFilterOptionModel(name: '70% or more'),
  DTFilterOptionModel(name: '50% or more'),
  DTFilterOptionModel(name: '40% or more'),
  DTFilterOptionModel(name: '30% or more'),
  DTFilterOptionModel(name: '20% or more'),
  DTFilterOptionModel(name: '10% or more'),
  DTFilterOptionModel(name: '10% and below'),
];

List<DTFilterOptionModel> mAvailability = [
  DTFilterOptionModel(name: 'include out of stock'),
];
