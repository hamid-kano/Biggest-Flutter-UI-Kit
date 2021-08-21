import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/customTemperatureWidget/modal/temprature.dart';

class TemperatureWidget extends StatefulWidget {
  Temperature? temperature;
  Function(double)? onChanged;

  TemperatureWidget({this.temperature, this.onChanged});

  @override
  _TemperatureWidgetState createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  Color? getBackColor(double value) {
    int newValue = value.toInt();
    Color? newColor;
    if (newValue >= 16 && newValue < 19) {
      newColor = Colors.green;
    } else if (newValue >= 19 && newValue < 22) {
      newColor = Colors.teal;
    } else if (newValue >= 22 && newValue < 25) {
      newColor = Colors.blue;
    } else if (newValue >= 25 && newValue < 28) {
      newColor = Colors.purple;
    } else if (newValue >= 28) {
      newColor = Colors.red;
    }

    return newColor!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 500.milliseconds,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: radius(defaultRadius),
        color: getBackColor(widget.temperature!.value!),
      ),
      height: 100,
      width: context.width(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Temp', style: boldTextStyle(color: Colors.white)),
          Row(
            children: [
              Text('16°C', style: primaryTextStyle(color: Colors.white)),
              Slider(
                min: 16,
                max: 30,
                value: widget.temperature!.value!,
                activeColor: Colors.white,
                inactiveColor: Colors.white.withOpacity(0.2),
                onChanged: (value) {
                  setState(() {
                    widget.onChanged!(value);
                  });
                },
              ).expand(),
              Text('30°C', style: primaryTextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
