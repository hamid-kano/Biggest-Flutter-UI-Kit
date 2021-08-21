import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PEClipOvalScreen extends StatefulWidget {
  static String tag = '/PEClipOvalScreen';

  @override
  PEClipOvalScreenState createState() => PEClipOvalScreenState();
}

class PEClipOvalScreenState extends State<PEClipOvalScreen> {
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
        appBar: appBar(context, 'Clip Widgets'),
        body: ListView(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Text('Clip Oval', style: boldTextStyle()).paddingBottom(10),
            ClipOval(
              child: CachedNetworkImage(
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg',
              ),
            ),
            20.height,
            Text('Clip Rect', style: boldTextStyle()).paddingBottom(10),
            ClipRect(
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.75,
                  heightFactor: 0.75,
                  child: CachedNetworkImage(placeholder: (_, s) => placeholderWidget(), imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg'),
                ),
              ),
            ),
            20.height,
            Text('ClipRRect', style: boldTextStyle()).paddingBottom(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.75,
                  heightFactor: 0.75,
                  child: CachedNetworkImage(placeholder: (_, s) => placeholderWidget(), imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg'),
                ),
              ),
            ),
            20.height,
            Text('ClipPath with custom clipper', style: boldTextStyle()).paddingBottom(10),
            ClipPath(
              clipper: MyCustomClipper(),
              child: CachedNetworkImage(
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://www.mockrabbit.com/wp-content/uploads/2018/12/Become-a-Full-Stack-Developers.jpg',
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
