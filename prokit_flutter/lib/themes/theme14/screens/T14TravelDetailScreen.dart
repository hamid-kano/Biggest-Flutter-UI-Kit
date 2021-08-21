import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Images.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Widget.dart';

class T14TravelDetailScreen extends StatefulWidget {
  @override
  _T14TravelDetailScreenState createState() => _T14TravelDetailScreenState();
}

class _T14TravelDetailScreenState extends State<T14TravelDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroll) {
          return [
            SliverAppBar(
              expandedHeight: 350.0,
              floating: false,
              elevation: 0.0,
              pinned: true,
              leading: Icon(Icons.arrow_back_ios, size: 22).onTap(() {
                finish(context);
              }),
              actions: [IconButton(icon: Icon(Icons.star_border, size: 20), onPressed: () {})],
              flexibleSpace: FlexibleSpaceBar(background: Image.asset(t14_travel2, fit: BoxFit.cover)),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t14_txt_Park_city, style: boldTextStyle(color: t14_colorBlue)).paddingOnly(top: 16, left: 16, bottom: 8),
                Text('Easter Island', style: secondaryTextStyle(size: 14)).paddingOnly(left: 16, bottom: 16),
                Text(t14_txt_Travel_Detail_Des, style: secondaryTextStyle(size: 16)).paddingSymmetric(horizontal: 16),
                24.height,
                t14AppButton(
                  context,
                  btnText: 'Start a trip',
                  bgColor: t14_SignInBgColor,
                  width: context.width(),
                  shape: 10.0,
                  txtColor: t14_colorSkyBlue,
                ).paddingSymmetric(horizontal: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
