import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ShaderMaskScreen extends StatefulWidget {
  static String tag = '/ShaderMaskScreen';

  @override
  ShaderMaskScreenState createState() => ShaderMaskScreenState();
}

class ShaderMaskScreenState extends State<ShaderMaskScreen> {
  var gradientColor1 = <Color>[Colors.blue, Color(0xFFFF4E50), Color(0xFFc31432), Color(0xFF8360c3), Color(0xFF1e130c)];
  var gradientColor2 = <Color>[Colors.pink, Color(0xFFF9D423), Color(0xFF240b36), Color(0xFF2ebf91), Color(0xFF9a8478)];
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    final body = Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Image Shadermask:", style: primaryTextStyle(fontFamily: fontMedium, size: 18)),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(2))),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: [
                    gradientColor1[selected],
                    gradientColor2[selected],
                  ],
                ).createShader(rect);
              },
              child: FlutterLogo(size: 90),
              blendMode: BlendMode.srcATop,
            ),
          ),
          SizedBox(height: 30),
          Text("Text Shadermask:", style: primaryTextStyle(fontFamily: fontMedium, size: 18)),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(2))),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(colors: [
                  gradientColor1[selected],
                  gradientColor2[selected],
                ]).createShader(rect);
              },
              child: text('This is the Example of ShaderMask. You can apply Gredient or Color on a Text, Image or any Widget.', fontSize: textSizeNormal, maxLine: 4, fontFamily: fontBold),
              blendMode: BlendMode.srcATop,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (selected == gradientColor1.length - 1) {
                  selected = 0;
                } else {
                  selected += 1;
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: textPrimary('Change Colors', aFontFamily: fontSemibold),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar(context, 'ShaderMask'),
      body: body,
    );
  }
}
