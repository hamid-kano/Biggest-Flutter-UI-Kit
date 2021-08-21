import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/percent_indicator/linear_percent_indicator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';

bool value = true;

InputDecoration buildInputDecoration(String name) {
  return InputDecoration(
    hintText: name,
    hintStyle: primaryTextStyle(color: white),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: viewLineColor, width: 0.5)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: viewLineColor, width: 0.5)),
  );
}

Widget playMusicWidget(BuildContext context) {
  return Container(
    color: cardBackgroundBlackDark,
    width: context.width(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       LinearPercentIndicator(width: context.width(), lineHeight: 2.0, percent: 0.6, progressColor: mpAppButtonColor),
        4.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commonCacheImageWidget(mpImages_1, 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You Are Free", style: boldTextStyle(color: white.withOpacity(0.8))),
                4.height,
                Text(" Bally Wonger", maxLines: 2, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: mpAppTextColor1)),
              ],
            ).expand(),
            Row(
              children: [
                Icon(Icons.chevron_left_outlined, color: mpAppButtonColor, size: 25).onTap(() {
                  toast('Previous', bgColor: Colors.white, textColor: Colors.black);
                }),
                16.width,
                Icon(Icons.play_circle_outline, color: mpAppButtonColor, size: 30).onTap(() {
                  toast('Play', bgColor: Colors.white, textColor: Colors.black);
                }),
                16.width,
                Icon(Icons.keyboard_arrow_right, color: mpAppButtonColor, size: 25).onTap(() {
                  toast('Next', bgColor: Colors.white, textColor: Colors.black);
                }),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16, bottom: 8, top: 4),
      ],
    ),
  );
}

Widget editProfileWidget({required String title, required String uName}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: primaryTextStyle(color: Colors.white)),
      Text(uName, style: secondaryTextStyle(color: Colors.white.withOpacity(0.7), size: 14)),
    ],
  );
}

Widget editProfileIconWidget({required String title, IconData? icon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: primaryTextStyle(color: Colors.white)),
      Icon(icon, color: white, size: 25),
    ],
  );
}

// ignore: must_be_immutable
class EditProfileSwitchWidget extends StatefulWidget {
  final String? name;
  bool isSelected;

  EditProfileSwitchWidget({this.name, this.isSelected = true});

  @override
  EditProfileSwitchWidgetState createState() => EditProfileSwitchWidgetState();
}

class EditProfileSwitchWidgetState extends State<EditProfileSwitchWidget> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.name!, style: primaryTextStyle(color: Colors.white)),
        Switch(
          activeColor: white,
          activeTrackColor: mpAppButtonColor,
          inactiveTrackColor: gray,
          value: widget.isSelected,
          onChanged: (val) {
            setState(() {
              widget.isSelected = val;
            });
          },
        )
      ],
    );
  }
}

Widget searchIconWidget({Function? onPressed}) {
  return IconButton(
    icon: Icon(Icons.search, color: white.withOpacity(0.9)),
    onPressed: () {
      onPressed?.call();
    },
  );
}
