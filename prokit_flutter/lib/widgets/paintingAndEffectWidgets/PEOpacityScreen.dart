import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PEOpacityScreen extends StatefulWidget {
  static String tag = '/PEOpacityScreen';

  @override
  PEOpacityScreenState createState() => PEOpacityScreenState();
}

class PEOpacityScreenState extends State<PEOpacityScreen> {
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
        appBar: appBar(context, 'Opacity'),
        body: ListView(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Text('Opacity with different opacity value', style: boldTextStyle()).paddingBottom(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Opacity(
                    opacity: 0.2,
                    child: FadeInImage(
                        height: 100,
                        width: 100,
                        placeholder: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image,
                        image: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
                Expanded(
                  flex: 1,
                  child: Opacity(
                    opacity: 0.5,
                    child: FadeInImage(
                        height: 100,
                        width: 100,
                        placeholder: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image,
                        image: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
                Expanded(
                  flex: 1,
                  child: Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: 1,
                    child: FadeInImage(
                        height: 100,
                        width: 100,
                        placeholder: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image,
                        image: Image.asset('images/widgets/paintingAndEffectWidgets/opacity/opactiy1.png').image),
                  ),
                ),
              ],
            ),
            20.height,
            Text('Opacity with ColorFilter', style: boldTextStyle()).paddingBottom(20),
            Container(
              height: 200,
              width: context.width(),
              decoration: BoxDecoration(image: DecorationImage(image: CachedNetworkImageProvider('https://i.picsum.photos/id/772/200/300.jpg?hmac=jap7uDpPOJZv41ksTZ3pa9FnXwuaBUpnni4hYBjZtfM'))),
              child: Text("Without Opacity", style: boldTextStyle(size: 25, color: Colors.white)).center(),
            ),
            Container(
              height: 200,
              width: context.width(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),
                  image: CachedNetworkImageProvider('https://i.pinimg.com/originals/a7/3d/6e/a73d6e4ac85c6a822841e449b24c78e1.jpg'),
                ),
              ),
              child: Text("With Opacity", style: boldTextStyle(size: 25, color: Colors.white)).center(),
            ).paddingTop(10),
            20.height,
            Text('Opacity with ColorFilter saturation mode', style: boldTextStyle()).paddingBottom(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: 'https://images.unsplash.com/photo-1487035242901-d419a42d17af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                ),
                10.width,
                Expanded(
                  flex: 1,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.black, BlendMode.saturation),
                    child: CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        imageUrl: 'https://images.unsplash.com/photo-1487035242901-d419a42d17af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                  ),
                ),
              ],
            ).paddingBottom(20)
          ],
        ),
      ),
    );
  }
}
