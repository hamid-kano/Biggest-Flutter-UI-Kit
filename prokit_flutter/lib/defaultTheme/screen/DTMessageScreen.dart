import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/model/DTChatMessageModel.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTDataProvider.dart';
import 'package:prokit_flutter/defaultTheme/utils/DTWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class DTMessageScreen extends StatefulWidget {
  static String tag = '/DTMessageScreen';

  @override
  _DTMessageScreenState createState() => _DTMessageScreenState();
}

class _DTMessageScreenState extends State<DTMessageScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();

  List<DTChatMessageModel> msgListing = [];
  var personName = 'John Doe';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    msgListing = getChatMsgData();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget textFieldWidget() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: msgController,
                  focusNode: msgFocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration.collapsed(hintText: 'Write to $personName', hintStyle: primaryTextStyle()),
                  style: primaryTextStyle(),
                ).expand(),
                IconButton(
                  icon: Icon(Icons.send, size: 25, color: appStore.iconColor),
                  onPressed: () async {
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
                      setState(() {});

                      await Future.delayed(Duration(seconds: 1));

                      msgListing.insert(0, msgModel1);

                      if (mounted) scrollController.animToTop();
                    } else {
                      FocusScope.of(context).requestFocus(msgFocusNode);
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(context, personName),
        body: Stack(
          children: [
            ListView.separated(
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
            Align(alignment: Alignment.bottomCenter, child: textFieldWidget()),
          ],
        ),
      ),
    );
  }
}
