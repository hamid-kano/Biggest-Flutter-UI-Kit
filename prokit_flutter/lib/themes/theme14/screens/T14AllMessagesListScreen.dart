import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme14/model/T14Model.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Colors.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14DataGenerator.dart';
import 'package:prokit_flutter/themes/theme14/utils/T14Strings.dart';

import 'T14ChattingScreen.dart';

class T14AllMessagesListScreen extends StatefulWidget {
  @override
  _T14AllMessagesListScreenState createState() => _T14AllMessagesListScreenState();
}

class _T14AllMessagesListScreenState extends State<T14AllMessagesListScreen> {
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: t14_colorWhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.grey, size: 20),
          onPressed: () {
            finish(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(AntDesign.search1, size: 20, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(AntDesign.pluscircleo, size: 20, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t14_txt_messages, style: boldTextStyle(color: t14_colorBlue, size: 20)),
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
                ).onTap(() {
                  String? img = messageList[index].img;
                  String? name = messageList[index].name;
                  T14ChattingScreen(img: img, name: name).launch(context);
                });
              },
            ),
          ],
        ).paddingOnly(right: 16, left: 16, bottom: 16),
      ),
    );
  }
}
