import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

class T14CommunicationScreen3 extends StatefulWidget {
  @override
  _T14CommunicationScreen3State createState() => _T14CommunicationScreen3State();
}

class _T14CommunicationScreen3State extends State<T14CommunicationScreen3> {
  List<MessageListModel> userList = getUserList();
  List<MessageListModel> messageList = getMessageList();

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
      backgroundColor: t14_colorLightCrem1,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: t14_colorLightCrem1,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 20),
            onPressed: () {
              finish(context);
            }),
        actions: [IconButton(icon: Icon(Icons.menu, size: 20), onPressed: () {})],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: t14_colorLightCrem1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t14_txt_Communication3, style: boldTextStyle(color: t14_colorBlue, size: 20)).paddingSymmetric(horizontal: 16),
                          Container(
                            height: 140,
                            child: ListView.builder(
                                itemCount: userList.length,
                                padding: EdgeInsets.all(8),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  MessageListModel data = userList[index];
                                  return Container(
                                    margin: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                              child: Image.asset(data.img!, height: 70, width: 70, fit: BoxFit.cover),
                                            ),
                                            Positioned(
                                              right: -10,
                                              bottom: 45,
                                              child: Icon(Entypo.dot_single, color: data.isActive! ? t14_TextField_BgColor : Colors.transparent, size: 35),
                                            ),
                                          ],
                                        ),
                                        8.height,
                                        Text(data.name!, style: boldTextStyle(color: t14_colorBlue, size: 14)),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                    backgroundColor: white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Teammates', style: boldTextStyle(size: 16, color: t14_colorBlue)),
                          Icon(Icons.search, size: 20),
                        ],
                      ),
                      ListView.builder(
                          itemCount: messageList.length,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            MessageListModel data = messageList[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
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
                                      Row(
                                        children: [
                                          Text(data.name!, style: boldTextStyle(color: t14_colorBlue, size: 14)),
                                          Icon(Entypo.dot_single, color: data.isActive! ? Colors.green : Colors.transparent, size: 35),
                                        ],
                                      ),
                                      Text(data.message!, maxLines: 1, overflow: TextOverflow.ellipsis, style: secondaryTextStyle(color: t14_colorBlue, size: 12)),
                                    ],
                                  ).expand(),
                                  Text(data.lastSeen!, style: secondaryTextStyle(color: t14_colorBlue, size: 12)),
                                ],
                              ),
                            );
                          }),
                    ],
                  ).paddingAll(16),
                ),
              ],
            ),
          ),
          /*       Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 20),
                  onPressed: () {
                    finish(context);
                  }),
              IconButton(icon: Icon(Icons.menu, size: 20), onPressed: () {}),
            ],
          ),*/
        ],
      ),
    );
  }
}
