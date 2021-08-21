import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTChatMessageModel.dart';
import 'package:prokit_flutter/defaultTheme/model/DTChatModel.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTMessageScreen.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'DTDrawerWidget.dart';

class DTChatScreen extends StatefulWidget {
  static String tag = '/DTChatScreen';

  @override
  DTChatScreenState createState() => DTChatScreenState();
}

class DTChatScreenState extends State<DTChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();

  var msgListing = getChatMsgData();
  List<DTChatModel> chats = getChatData();
  String? personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      var msgModel = DTChatMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.Sender_id = sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = DTChatMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.Sender_id = receiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget msgList() {
      return ListView.separated(
        separatorBuilder: (_, i) => Divider(),
        padding: EdgeInsets.all(8),
        itemCount: chats.length,
        itemBuilder: (_, index) {
          DTChatModel data = chats[index];

          return GestureDetector(
            onTap: () {
              print(context.width());
              if (context.width() > 540 && !isMobile) {
                personName = data.name;

                setState(() {});
              } else {
                DTMessageScreen().launch(context);
              }
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage(
                    placeholder: Image.asset('images/widgets/cupertinoWidgets/grey.jpg', fit: BoxFit.cover).image,
                    image: Image.network(data.img!).image,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(30),
                  10.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name!, style: primaryTextStyle(color: appStore.textPrimaryColor)).expand(),
                            Text(data.time!, style: secondaryTextStyle(size: 12, color: appStore.textSecondaryColor)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(data.lastMsg!, style: secondaryTextStyle(size: 12), maxLines: 1).expand(),
                            2.width,
                            Row(
                              children: [
                                Icon(Icons.done_all, color: appColorPrimary, size: 14).withHeight(14),
                                2.width,
                                Container(
                                  decoration: BoxDecoration(color: appColorPrimary, shape: BoxShape.circle),
                                  child: Text(
                                    data.unreadCount.toString(),
                                    style: secondaryTextStyle(color: white, size: 10),
                                    maxLines: 1,
                                  ).paddingAll(6),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Widget mobileWidget() {
      return msgList();
    }

    Widget webWidget() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: msgList()),
          VerticalDivider(width: 5),
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
                  child: ListView.separated(
                    separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                    shrinkWrap: true,
                    reverse: true,
                    controller: scrollController,
                    itemCount: msgListing.length,
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
                    itemBuilder: (_, index) {
                      DTChatMessageModel data = msgListing[index];
                      var isMe = data.Sender_id == sender_id;

                      return ChatMessageWidget(isMe: isMe, data: data);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          controller: msgController,
                          focusNode: msgFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration.collapsed(hintText: personName!.isNotEmpty ? 'Write to $personName' : 'Type a message', hintStyle: primaryTextStyle()),
                          style: primaryTextStyle(),
                          onSubmitted: (s) {
                            sendClick();
                          },
                        ).expand(),
                        IconButton(
                          icon: Icon(Icons.send, size: 25, color: appStore.iconColor),
                          onPressed: () async {
                            sendClick();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: appBar(context, 'Chat'),
      drawer: DTDrawerWidget(),
      body: ContainerX(
        mobile: mobileWidget(),
        web: webWidget(),
        useFullWidth: true,
      ),
    );
  }
}
