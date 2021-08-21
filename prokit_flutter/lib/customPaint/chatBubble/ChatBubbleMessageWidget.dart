import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/chatBubble/ChatBubbleCustomPainter.dart';
import 'package:prokit_flutter/customPaint/chatBubble/modal/ChatBubbleModal.dart';

class ChatBubbleMessageWidget extends StatelessWidget {
  bool? isMe;
  ChatBubbleModal? data;

  ChatBubbleMessageWidget({this.isMe, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(),
            margin: isMe.validate() ? EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8, right: context.width() * 0.30) : EdgeInsets.only(top: 2.0, bottom: 2.0, left: context.width() * 0.30, right: 8),
            child: CustomPaint(
              painter: ChatBubbleCustomPainter(color: Colors.blue, alignment: isMe.validate() ? Alignment.topLeft : Alignment.topRight),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        data!.msg!,
                        style: primaryTextStyle(color: !isMe! ? Colors.white : Colors.white),
                      ),
                    ),
                    Text(
                      data!.time!,
                      style: secondaryTextStyle(color: !isMe! ? Colors.white : Colors.white, size: 12),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
