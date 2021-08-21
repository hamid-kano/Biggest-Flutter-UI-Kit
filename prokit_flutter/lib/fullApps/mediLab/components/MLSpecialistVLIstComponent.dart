import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLSpecialistData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

class MLSpecialistVListComponent extends StatefulWidget {
  static String tag = '/MLSpecialistVListComponent';

  @override
  MLSpecialistVListComponentState createState() => MLSpecialistVListComponentState();
}

class MLSpecialistVListComponentState extends State<MLSpecialistVListComponent> {
  List<MLSpecialistData> data = mlSpecialistDataDataList();

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
    return StaggeredGridView.countBuilder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12.0),
            border: Border.all(color: mlColorLightGrey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorGreyShade, borderRadius: radius(12.0)),
                child: Image.asset(data[index].image.validate(), fit: BoxFit.fill, width: 48, height: 48),
              ),
              8.height,
              Text(data[index].title.validate(), style: boldTextStyle()),
              4.height,
              Text(data[index].subtitle.validate(), style: secondaryTextStyle(size: 16)),
            ],
          ),
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    );
  }
}
