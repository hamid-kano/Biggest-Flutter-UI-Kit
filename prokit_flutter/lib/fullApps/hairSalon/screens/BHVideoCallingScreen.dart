import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class BHVideoCallingScreen extends StatefulWidget {
  static String tag = '/VideoCallingScreen';

  @override
  BHVideoCallingScreenState createState() => BHVideoCallingScreenState();
}

class BHVideoCallingScreenState extends State<BHVideoCallingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Carlos Day', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.camera_alt, color: Colors.white))],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          commonCacheImageWidget(
            BHCallingBackgroundImg,
            MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: commonCacheImageWidget(BHdDashedBoardImage5, 180, width: 130, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
