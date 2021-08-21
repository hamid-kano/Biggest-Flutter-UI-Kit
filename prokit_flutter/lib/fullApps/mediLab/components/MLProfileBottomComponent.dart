import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLProfileCardData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLProfileBottomComponent extends StatefulWidget {
  static String tag = '/MLProfileBottomComponent';

  @override
  MLProfileBottomComponentState createState() => MLProfileBottomComponentState();
}

class MLProfileBottomComponentState extends State<MLProfileBottomComponent> {
  List<String> data = <String>['Membership card', 'Dependents', 'Health care', 'Refer friends and family'];
  List<String> categoriesData = <String>['Prescription', 'Medical Record', 'Medical Test', 'Health Tracking'];
  List<Color> customColor = <Color>[Colors.blueAccent, Colors.orangeAccent, Colors.pinkAccent, Colors.cyan];
  List<MLProfileCardData> mlProfileData = mlProfileDataList();

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
      decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 32)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Main Categories', style: boldTextStyle(size: 18)),
              Text('04', style: secondaryTextStyle(size: 18)),
            ],
          ),
          16.height,
          StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount: mlProfileData.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: mlProfileData[index].color!,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(mlProfileData[index].img!, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(12.0),
                    16.height,
                    Row(
                      children: [
                        Text(mlProfileData[index].name.toString(), style: secondaryTextStyle(color: white), textAlign: TextAlign.start).expand(),
                        Icon(Icons.arrow_forward_ios, color: white, size: 12),
                      ],
                    )
                  ],
                ),
              ).onTap(() {
                toast(mlProfileData[index].name);
              });
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          16.height,
          Column(
            children: data.map((e) {
              return Container(
                margin: EdgeInsets.only(bottom: 16.0),
                padding: EdgeInsets.all(12.0),
                decoration: boxDecorationRoundedWithShadow(8),
                child: Row(
                  children: [
                    Icon(Icons.tab, size: 24, color: Colors.blue),
                    8.width,
                    Text(e.validate(), style: secondaryTextStyle(color: black, size: 16)).expand(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey[300], size: 16),
                  ],
                ),
              ).onTap(() {
                toast(e.validate());
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
