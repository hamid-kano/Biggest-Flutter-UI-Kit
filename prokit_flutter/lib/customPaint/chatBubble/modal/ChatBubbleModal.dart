import 'package:prokit_flutter/customPaint/chatBubble/utils.dart';

class ChatBubbleModal {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  ChatBubbleModal({this.senderId, this.receiverId, this.msg, this.time});
}

List<ChatBubbleModal> getChatBubbleMessageData() {
  List<ChatBubbleModal> list = [];

  list.add(ChatBubbleModal(msg: "Hello", receiverId: CHBReceiver_id, senderId: CHBSender_id, time: "1:30 pm"));
  list.add(ChatBubbleModal(msg: "How are you? What are you doing?", receiverId: CHBReceiver_id, senderId: CHBSender_id, time: "1:32 pm"));
  list.add(ChatBubbleModal(msg: "I am good. Can you do something for me? I need your help", receiverId: CHBSender_id, senderId: CHBReceiver_id, time: "1:35 pm"));
  list.add(ChatBubbleModal(msg: "Yes of Course", receiverId: CHBReceiver_id, senderId: CHBSender_id, time: "1:30 pm"));
  return list;
}
