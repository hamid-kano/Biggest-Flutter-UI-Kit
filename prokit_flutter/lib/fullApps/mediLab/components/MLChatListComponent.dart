import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLChatListComponent extends StatefulWidget {
  List<String> data;
  Color color;
  Widget screen;

  MLChatListComponent(this.data, this.color, this.screen);

  @override
  MLChatListComponentState createState() => MLChatListComponentState();
}

class MLChatListComponentState extends State<MLChatListComponent> {
  int notificationCounter = 3;

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
    return Column(
      children: widget.data.map((e) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: widget.color,
                    radius: 28.0,
                    child: Image.asset(ml_ic_doctor_image!, fit: BoxFit.cover, width: 56, height: 56).cornerRadiusWithClipRRect(30.0),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 2.0,
                    child: e == widget.data[0]
                        ? Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: Colors.greenAccent),
                          )
                        : Container(),
                  ),
                ],
              ),
              8.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: e.validate(), style: boldTextStyle()),
                            TextSpan(text: '(Clinic Visit)', style: secondaryTextStyle(size: 16)),
                          ],
                        ),
                      ),
                      Text('9.56 AM', style: boldTextStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("What are you doing?", style: secondaryTextStyle()),
                      Container(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorBlue, boxShape: BoxShape.circle),
                        child: Text(notificationCounter.toString(), style: secondaryTextStyle(color: whiteColor)),
                      ),
                    ],
                  )
                ],
              ).expand(),
            ],
          ).onTap(() {
            widget.screen.launch(context);
          }),
        );
      }).toList(),
    );
  }
}
