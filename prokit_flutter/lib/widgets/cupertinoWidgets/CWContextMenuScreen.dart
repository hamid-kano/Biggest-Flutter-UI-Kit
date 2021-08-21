import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class CWContextMenuScreen extends StatefulWidget {
  static String tag = '/CWContextMenuScreen';

  @override
  CWContextMenuScreenState createState() => CWContextMenuScreenState();
}

class CWContextMenuScreenState extends State<CWContextMenuScreen> {
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
        appBar: appBar(context, 'Cupertino Context Menu'),
        body: CustomTheme(
          child: CupertinoContextMenu(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: Image.asset(
                  'images/widgets/cupertinoWidgets/grey.jpg',
                  fit: BoxFit.cover,
                ).image,
                image: CachedNetworkImageProvider(
                  SampleImageUrl,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
              ).cornerRadiusWithClipRRect(10),
            ),
            actions: <Widget>[
              CupertinoContextMenuAction(
                child: Text(
                  'Copy',
                  style: primaryTextStyle(color: Colors.black),
                ),
                isDefaultAction: true,
                trailingIcon: Icons.content_copy,
                onPressed: () {
                  toast("Copy");
                  finish(context);
                },
              ),
              CupertinoContextMenuAction(
                child: Text('Share', style: primaryTextStyle(color: Colors.black)),
                trailingIcon: Icons.share,
                onPressed: () {
                  toast("Share");
                  finish(context);
                },
              ),
              CupertinoContextMenuAction(
                child: Text('Delete', style: primaryTextStyle(color: Colors.black)),
                trailingIcon: Icons.delete,
                onPressed: () {
                  toast("Delete");
                  finish(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
