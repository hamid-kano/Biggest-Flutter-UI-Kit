import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWIconButtonScreen extends StatefulWidget {
  static String tag = '/MWIconButtonScreen';

  @override
  MWIconButtonScreenState createState() => MWIconButtonScreenState();
}

class MWIconButtonScreenState extends State<MWIconButtonScreen> {
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
        appBar: appBar(context, "Icon Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.file_upload,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    toast("upload");
                  },
                ),
              ),
              10.height,
              IconButton(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save_alt,
                    ),
                    10.width,
                    Text('Download', style: primaryTextStyle()),
                  ],
                ),
                onPressed: () {
                  toast('download');
                },
              ),
              10.height,
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.greenAccent,
                  shape: CircleBorder(side: BorderSide(width: 2, color: Colors.black)),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    toast("Share");
                  },
                ),
              ),
              10.height,
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: appStore.iconColor,
                ),
                iconSize: 30,
                onPressed: () {
                  toast("Message");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
