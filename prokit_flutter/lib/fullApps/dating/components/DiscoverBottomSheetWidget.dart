import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DiscoverBottomSheetWidget extends StatefulWidget {
  @override
  DiscoverBottomSheetWidgetState createState() => DiscoverBottomSheetWidgetState();
}

class DiscoverBottomSheetWidgetState extends State<DiscoverBottomSheetWidget> {
  RangeValues currentRangeValues = RangeValues(10, 90);
  RangeValues values = RangeValues(1, 100);
  bool isActive = false;

  List<String> name = ['Male', 'Female'];
  int value = 0;

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.close).onTap(() {
                finish(context);
              }),
              Text('Filters', style: boldTextStyle()),
              Icon(Icons.check).onTap(() {
                finish(context);
              }),
            ],
          ),
          16.height,
          Text('Location', style: boldTextStyle()),
          16.height,
          Container(
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                16.width,
                Text('Los Angeles, CA', style: primaryTextStyle()),
              ],
            ),
          ),
          16.height,
          Text('Location', style: boldTextStyle()),
          16.height,
          Container(
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: name
                  .asMap()
                  .map((i, e) {
                    return MapEntry(
                      e,
                      Container(
                        height: 35,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(color: value == i ? deepSkyBlue : grey),
                          borderRadius: BorderRadius.circular(10),
                          color: value == i ? deepSkyBlue : white,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(e, style: secondaryTextStyle(color: value == i ? white : grey), textAlign: TextAlign.center),
                      ).onTap(() {
                        value = i;
                        setState(() {});
                      }),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
          16.height,
          Text('Age', style: boldTextStyle()),
          16.height,
          RangeSlider(
            min: 1,
            max: 100,
            values: currentRangeValues,
            onChanged: (values) {
              setState(() {
                currentRangeValues = values;
              });
            },
          ),
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
