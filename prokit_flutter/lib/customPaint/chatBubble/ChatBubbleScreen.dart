import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/chatBubble/ChatBubbleMessageWidget.dart';
import 'package:prokit_flutter/customPaint/chatBubble/modal/ChatBubbleModal.dart';
import 'package:prokit_flutter/customPaint/chatBubble/utils.dart';

class ChatBubbleScreen extends StatefulWidget {
  @override
  ChatBubbleScreenState createState() => ChatBubbleScreenState();
}

class ChatBubbleScreenState extends State<ChatBubbleScreen> {
  ScrollController controller = ScrollController();

  TextEditingController msgController = TextEditingController();

  FocusNode msgFocusNode = FocusNode();

  List<ChatBubbleModal> msgList = getChatBubbleMessageData();

  String personName = '';
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
    return Scaffold(
      appBar: appBarWidget('Chat Bubble Screen', center: true, color: context.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                shrinkWrap: true,
                reverse: true,
                controller: controller,
                itemCount: msgList.length,
                itemBuilder: (_, index) {
                  ChatBubbleModal data = msgList[index];
                  bool isMe = data.senderId == CHBSender_id;

                  return ChatBubbleMessageWidget(isMe: isMe, data: data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
