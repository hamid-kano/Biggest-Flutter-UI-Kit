import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLDieaseaseComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLSearchDiseaseScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLDiseaseScreen extends StatefulWidget {
  static String tag = '/MLDiseaseScreen';

  @override
  MLDiseaseScreenState createState() => MLDiseaseScreenState();
}

class MLDiseaseScreenState extends State<MLDiseaseScreen> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  List<String> slides = <String>[
    ml_ic_diseaseSlide1!,
    ml_ic_diseaseSlide2!,
    ml_ic_diseaseSlide3!,
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
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
        backgroundColor: mlPrimaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: mlPrimaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: white, size: 20).onTap(() {
                            finish(context);
                          }),
                          8.width,
                          Text(mlDisease_symptoms!, style: boldTextStyle(size: 20, color: white)).expand(),
                          Icon(Icons.search, color: white, size: 24).onTap(() {
                            MLSearchDiseaseScreen().launch(context);
                          })
                        ],
                      ).paddingAll(16.0),
                      16.height,
                      Container(
                        height: 170,
                        child: PageView(
                          controller: controller,
                          children: slides.map((e) {
                            return Image.asset(e.validate(), fit: BoxFit.fill).cornerRadiusWithClipRRect(12.0).paddingOnly(right: 16);
                          }).toList(),
                        ),
                      ),
                      16.height,
                      DotIndicator(
                        pageController: controller,
                        pages: slides,
                        unselectedIndicatorColor: white.withOpacity(0.5),
                      ),
                      16.height,
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return MLDieaseaseComponent();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
