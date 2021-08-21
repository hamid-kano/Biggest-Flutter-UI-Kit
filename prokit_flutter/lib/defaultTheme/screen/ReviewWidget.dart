import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTReviewModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import '../../main.dart';

class ReviewWidget extends StatefulWidget {
  static String tag = '/ReviewWidget';
  final List<DTReviewModel>? list;
  final bool? enableScrollPhysics;

  ReviewWidget({this.list, this.enableScrollPhysics});

  @override
  ReviewWidgetState createState() => ReviewWidgetState();
}

class ReviewWidgetState extends State<ReviewWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 8, top: 16),
      itemCount: widget.list!.length,
      itemBuilder: (_, index) {
        DTReviewModel data = widget.list![index];

        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(16),
          decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Icon(Icons.person_outline, color: white),
                decoration: BoxDecoration(shape: BoxShape.circle, color: appColorPrimary),
                padding: EdgeInsets.all(4),
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name!, style: boldTextStyle()),
                  Row(
                    children: [
                      IgnorePointer(
                        child: RatingBar(
                          onRatingUpdate: (r) {},
                          itemSize: 14.0,
                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                          initialRating: data.ratting,
                        ),
                      ),
                      16.width,
                      Text(data.ratting.toString(), style: secondaryTextStyle()),
                    ],
                  ),
                  Text(data.comment!, style: secondaryTextStyle()),
                ],
              ).expand(),
            ],
          ),
        );
      },
      physics: widget.enableScrollPhysics.validate(value: true) ? ScrollPhysics() : NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
