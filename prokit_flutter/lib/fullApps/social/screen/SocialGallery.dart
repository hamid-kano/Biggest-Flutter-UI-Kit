import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/social/model/SocialModel.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialDataGenerator.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/panel.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class SocialGallery extends StatefulWidget {
  static String tag = '/SocialGallery';

  @override
  SocialGalleryState createState() => SocialGalleryState();
}

class SocialGalleryState extends State<SocialGallery> {
  @override
  void initState() {
    setStatusBarColor(
      Colors.grey[200]!,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SlidingUpPanel Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _initFabHeight = 90.0;
  double? _fabHeight;
  double? _panelHeightOpen;
  late List<Media> mList;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
    mList = addMediaData();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    double _panelHeightClosed = MediaQuery.of(context).size.width * 0.3;

    var width = MediaQuery.of(context).size.width;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc!),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen! - _panelHeightClosed) + _initFabHeight;
            }),
          ),

          Positioned(
            top: 15,
            child: Hero(
              tag: "DemoTag",
              child: Icon(
                Icons.add,
                size: 50.0,
              ),
            ),
          ),

          // the fab
          Positioned(
            left: 16,
            right: 16,
            bottom: _fabHeight,
            child: Container(
              width: width,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(spacing_large),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.flash_off,
                    color: social_white,
                    size: width * 0.09,
                  ),
                  Container(
                    width: width * 0.2,
                    height: width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 6.0, color: social_white),
                    ),
                  ),
                  Icon(Icons.camera_alt, color: social_white, size: width * 0.09),
                ],
              ),
            ),
          ),

          Positioned(
              top: 0,
              child: ClipRRect(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).padding.top,
                color: Colors.transparent,
              ))),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(height: 18.0),
            Container(
                margin: EdgeInsets.only(left: spacing_middle, right: spacing_middle),
                width: double.infinity, //To make it use as much space as it wants
                height: _panelHeightOpen,
                child: Column(children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                      itemCount: mList.length,
                      itemBuilder: (context, index) {
                        return SocialMedia(mList[index], index);
                      },
                    ),
                  ),
                ])),
            SizedBox(height: 36.0),
          ],
        ));
  }

  Widget _body() {
    return CachedNetworkImage(
      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
      imageUrl: social_ic_user1,
    );
  }
}

// ignore: must_be_immutable
class SocialMedia extends StatelessWidget {
  late Media model;

  SocialMedia(Media model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
          imageUrl: model.image,
          fit: BoxFit.fill,
          height: width * 0.15,
          width: width * 0.25,
        ),
      ),
    );
  }
}
