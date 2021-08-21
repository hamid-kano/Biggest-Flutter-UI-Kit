import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWPopupMenuButtonScreen extends StatefulWidget {
  static String tag = '/MWPopupMenuButtonScreen';

  @override
  MWPopupMenuButtonScreenState createState() => MWPopupMenuButtonScreenState();
}

class MWPopupMenuButtonScreenState extends State<MWPopupMenuButtonScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Popup Menu Button"),
        body: Container(
          padding: EdgeInsets.all(12),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Default Popup menu',
                      style: primaryTextStyle(),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        toast(value);
                      },
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: Text("Mark as read"),
                            value: 'Mark as read',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Mute Notification"),
                            value: ' Mute Notification',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Settings"),
                            value: 'Settings',
                          ),
                        );
                        return list;
                      },
                    )),
              ),
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Sectioned Popup menu',
                      style: primaryTextStyle(),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        toast(value);
                      },
                      offset: Offset(0, 100),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>>  list = [];
                        list.add(
                          PopupMenuItem(
                            child: Text("Select Language"),
                            value: 'Select Language',
                          ),
                        );
                        list.add(PopupMenuDivider(
                          height: 2,
                        ));
                        list.add(
                          PopupMenuItem(
                            child: Text("English"),
                            value: 'English',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Spanish"),
                            value: 'Spanish',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Arabic"),
                            value: 'Arabic',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Hindi"),
                            value: 'Hindi',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: Text("Gujarati"),
                            value: 'Gujarati',
                          ),
                        );

                        return list;
                      },
                    )),
              ),
              Card(
                elevation: 4,
                child: ListTile(
                    title: Text(
                      'Popup menu with Icons',
                      style: primaryTextStyle(),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: appStore.textPrimaryColor,
                      ),
                      onSelected: (dynamic value) {
                        toast(value);
                      },
                      offset: Offset(0, 100),
                      itemBuilder: (context) {
                        List<PopupMenuEntry<Object>> list = [];
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.file_upload,
                                color: Colors.black,
                              ),
                              title: Text('Upload'),
                            ),
                            value: 'Upload',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.bookmark,
                                color: Colors.black,
                              ),
                              title: Text('Bookmark'),
                            ),
                            value: 'Bookmark',
                          ),
                        );
                        list.add(
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                              title: Text('Share'),
                            ),
                            value: 'Share',
                          ),
                        );
                        return list;
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
