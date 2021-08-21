import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14CommunicationScreen4 extends StatefulWidget {
  @override
  _T14CommunicationScreen4State createState() => _T14CommunicationScreen4State();
}

class _T14CommunicationScreen4State extends State<T14CommunicationScreen4> {
  List<MessageListModel> messageCountList = getMessageCountList();

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: t14_colorLightCrem1,
                height: context.height() * 0.3,
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(t14_txt_messages, textAlign: TextAlign.center, style: boldTextStyle()).expand(),
                    Icon(Icons.search, size: 20),
                  ],
                ),
              ),
              Container(
                decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.all(Radius.circular(16)), backgroundColor: white),
                margin: EdgeInsets.only(top: 60),
                child: ListView.builder(
                    itemCount: messageCountList.length,
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      MessageListModel data = messageCountList[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: boxDecorationWithShadow(
                                decorationImage: DecorationImage(image: Image.asset(data.img!).image, fit: BoxFit.cover),
                                boxShape: BoxShape.circle,
                              ),
                            ),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name!, style: boldTextStyle(color: t14_colorBlue, size: 14)),
                                Text(data.message!, maxLines: 1, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: t14_colorBlue, size: 12)),
                              ],
                            ).expand(),
                            Container(
                              height: 25,
                              width: 25,
                              alignment: Alignment.center,
                              decoration: boxDecorationWithShadow(boxShape: BoxShape.circle, backgroundColor: t14_msgCount_BgColor),
                              child: Text(data.lastSeen!, style: boldTextStyle(color: white, size: 12), textAlign: TextAlign.center),
                            ).visible(data.isActive!)
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
