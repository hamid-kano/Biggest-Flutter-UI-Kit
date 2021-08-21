import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/wave/config.dart';
import 'package:prokit_flutter/main/utils/wave/wave.dart';

class WaveScreen extends StatefulWidget {
  static String tag = '/WaveScreen';

  @override
  WaveScreenState createState() => WaveScreenState();
}

class WaveScreenState extends State<WaveScreen> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      appBar: appBar(context, "Wave Widget"),
      body: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Color(0xFF676B76), Color(0xEE676B76)],
            [Color(0xFFECB099), Color(0xEEECB099)],
            [Color(0xFFdea34b), Color(0xEEdea34b)],
            [Color(0xFFA3CEB6), Color(0xEEA3CEB6)],
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.30],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 0,
        backgroundColor: Colors.white,
        size: Size(double.infinity, double.infinity),
      ),
    );
  }
}
