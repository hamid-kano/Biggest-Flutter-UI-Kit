import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';

// ignore: must_be_immutable
class SDChatPageViewScreen extends StatefulWidget {
  String? name;
  String? profileImages;

  SDChatPageViewScreen({this.name, this.profileImages});

  @override
  _SDChatPageViewScreenState createState() => _SDChatPageViewScreenState();
}

class _SDChatPageViewScreenState extends State<SDChatPageViewScreen> {
  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  @override
  void initState() {
    super.initState();
    childList.clear();
    childList.add(
      Align(
        alignment: Alignment(0, 0),
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            margin: const EdgeInsets.only(top: 5.0),
            decoration: boxDecorations(bgColor: sdViewColor),
            child: Center(child: Text("Today", style: TextStyle(fontSize: 11))),
          ),
        ),
      ),
    );
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(content: 'Hello ${widget.name}', time: '01:36 PM'),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(content: 'How are you? What are you doing?', time: '01:36 PM'),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(content: 'Hello, Mark.I am fine. How are you?', time: '01:40 PM'),
    ));
    childList.add(
      Align(
        alignment: Alignment(1, 0),
        child: SendedMessageWidget(content: 'I am good. Can you do something for me? I need your help.', time: '01:40 PM'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 65,
                    color: sdPrimaryColor,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: AssetImage('Loading'),
                              image: Image.network(
                                widget.profileImages == null ? 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp' : widget.profileImages!,
                                height: 35,
                                width: 10,
                              ).image,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(widget.name == null ? 'Ankit Gada' : widget.name!, style: TextStyle(color: Colors.white, fontSize: 16)),
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text("online", style: TextStyle(color: Colors.white60, fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: PopupMenuButton(
                            icon: Icon(Icons.more_vert, color: Colors.white),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem(value: 1, child: Text("View Contact")),
                              PopupMenuItem(value: 2, child: Text("Search")),
                              PopupMenuItem(value: 3, child: Text("Mute notification")),
                              PopupMenuItem(value: 4, child: Text("Report")),
                              PopupMenuItem(value: 5, child: Text("Clear chat")),
                              PopupMenuItem(value: 6, child: Text("Block user")),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: childList,
                      ),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: 75,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 5),
                            margin: EdgeInsets.only(bottom: 10, left: 15, right: 5),
                            decoration: boxDecoration(radius: 5, backGroundColor: Colors.white60, blurRadius: 0, spreadRadius: 0),
                            child: TextField(
                              style: TextStyle(fontSize: 20),
                              controller: _text,
                              maxLines: 15,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type your message',
                                hintStyle: secondaryTextStyle(),
                                suffixIcon: Icon(Icons.attach_file),
                                prefixIcon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, bottom: 15),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: sdPrimaryColor,
                            child: IconButton(
                              icon: Icon(Icons.send, color: Colors.white, size: 20),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget ReceivedMessageWidget({required String content, required String time}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(right: 75.0, left: 8.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: boxDecorations(showShadow: true, radius: 6),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                child: Text(
                  content,
                  style: primaryTextStyle(
                    size: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SendedMessageWidget({required String content, required String time}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 50.0, top: 4.0, bottom: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5), topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        child: Container(
          color: sdPrimaryColor,
          // margin: const EdgeInsets.only(left: 10.0),
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 8.0, bottom: 16.0),
              child: Text(
                content,
                style: primaryTextStyle(size: 14, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 10,
              child: Text(
                time,
                style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.8)),
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
