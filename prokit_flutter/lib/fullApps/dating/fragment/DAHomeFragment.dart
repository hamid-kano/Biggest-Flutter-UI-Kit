import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/components/DiscoverBottomSheetWidget.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAZoomingScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAHomeFragment extends StatefulWidget {
  @override
  DAHomeFragmentState createState() => DAHomeFragmentState();
}

class DAHomeFragmentState extends State<DAHomeFragment> {
  List<DatingAppModel> list = getAllListData();
  late SwiperController controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    controller = SwiperController();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Discover',
        center: true,
        titleTextStyle: boldTextStyle(size: 25),
        showBack: false,
        actions: [
          Icon(Icons.sort).paddingOnly(right: 16).onTap(() {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
              context: context,
              builder: (BuildContext context) {
                return DiscoverBottomSheetWidget();
              },
            );
          }),
        ],
      ),
      body: Swiper(
        controller: controller,
        itemHeight: context.height() * 0.7,
        itemCount: list.length,
        itemWidth: context.width() * 0.8,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: context.height() * 0.7,
                width: context.width() * 0.8,
                child: commonCachedNetworkImage(
                  list[index].image!.validate(),
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(10).onTap(() {
                  DAZoomingScreen(img: list[index].image).launch(context);
                }),
              ),
              Container(
                height: context.height() * 0.7,
                width: context.width() * 0.8,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.black26),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.width,
                    Row(
                      children: [
                        Text('${list[index].name!.validate()},', style: boldTextStyle(color: lightYellow, size: 20)),
                        8.width,
                        Text(list[index].age.toString().validate(), style: boldTextStyle(color: lightYellow, size: 18)),
                      ],
                    ),
                    Text(list[index].education!.validate(), style: boldTextStyle(color: khaki, size: 15)),
                    8.height,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(color: redColor.withOpacity(0.7), shape: BoxShape.circle),
                          child: Icon(Icons.clear, color: white, size: 30),
                        ).onTap(() {
                          controller.next(animation: true);
                        }),
                        16.width,
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(color: greenColor.withOpacity(0.7), shape: BoxShape.circle),
                          child: Icon(Icons.check, color: white, size: 30),
                        ).onTap(() {
                          controller.next(animation: true);
                        }),
                      ],
                    ),
                  ],
                ),
              ).paddingOnly(left: 16, bottom: 24),
            ],
          );
        },
      ),
    );
  }
}
