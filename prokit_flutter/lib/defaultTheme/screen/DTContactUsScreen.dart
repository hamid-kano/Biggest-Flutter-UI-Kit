import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'DTDrawerWidget.dart';

class DTContactUsScreen extends StatefulWidget {
  static String tag = '/DTContactUsScreen';

  @override
  DTContactUsScreenState createState() => DTContactUsScreenState();
}

class DTContactUsScreenState extends State<DTContactUsScreen> {
  var searchCont = TextEditingController();

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
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(context, 'Contact Us'),
        drawer: DTDrawerWidget(),
        body: Stack(
          children: [
            isMobile
                ? Container(
                    height: context.height(),
                    width: context.width(),
                    color: white,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(target: LatLng(43.7262115, 12.636526499999945), zoom: 5),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    height: context.height(),
                    alignment: Alignment.center,
                    width: context.width(),
                    child: Text('Google Maps support is coming soon', style: primaryTextStyle(size: 18)),
                  ),
            Container(
              margin: EdgeInsets.all(16),
              height: 50,
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.scaffoldBackground!),
              child: TextFormField(
                controller: searchCont,
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  hintText: 'Find our office',
                  hintStyle: primaryTextStyle(),
                  contentPadding: EdgeInsets.all(16),
                  labelStyle: secondaryTextStyle(),
                  suffixIcon: Icon(Icons.near_me, color: appColorPrimary),
                  prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.name,
                validator: (s) {
                  if (s!.trim().isEmpty) return errorThisFieldRequired;
                  if (!s.trim().validateEmail()) return 'Email is invalid';
                  return null;
                },
                textInputAction: TextInputAction.done,
              ).paddingOnly(left: 8, right: 8),
            ).visible(isMobile),
            Positioned(
              bottom: 12,
              right: 0,
              left: 0,
              child: Container(
                height: 225,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        height: 180,
                        decoration: BoxDecoration(color: appStore.scaffoldBackground, borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          children: [
                            24.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Entypo.location_pin, color: appStore.iconColor),
                                6.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Headquarter', style: boldTextStyle(color: appColorPrimary)),
                                    Text('236, Erwin Brook Suite 688 \nNew York, NY 10007', style: secondaryTextStyle(size: 12)),
                                  ],
                                )
                              ],
                            ).paddingOnly(left: 8, right: 8),
                            16.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Entypo.location_pin, color: appStore.iconColor),
                                6.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Brooklyn office', style: boldTextStyle(color: appColorPrimary)),
                                    Text('469, Philip Underpass Suite 945 \nBrookiyn, NY 11213', style: secondaryTextStyle(size: 12)),
                                  ],
                                )
                              ],
                            ).paddingOnly(left: 8, right: 8),
                            4.height
                          ],
                        ),
                      ),
                      bottom: 0,
                      left: 0,
                      right: 0,
                    ),
                    Positioned(
                      right: 50,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(shape: BoxShape.circle, gradient: defaultThemeGradient(), boxShadow: defaultBoxShadow()),
                        child: Icon(EvilIcons.sc_telegram, color: white, size: 45).paddingOnly(bottom: 4, right: 4),
                      ),
                    ),
                  ],
                ),
              ),
            ).visible(isMobile),
          ],
        ),
      ),
    );
  }
}
