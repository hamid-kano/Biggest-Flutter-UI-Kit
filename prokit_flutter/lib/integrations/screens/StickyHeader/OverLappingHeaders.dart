import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/sticky_header/sticky_headers/widget.dart';

class OverLappingHeaders extends StatelessWidget {
  static String tag = '/OverLappingHeaders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Headers overlapping the Content'),
      body: ListView.builder(itemBuilder: (context, index) {
        return StickyHeaderBuilder(
          overlapHeaders: true,
          builder: (BuildContext context, double stuckAmount) {
            stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
            return Container(
              height: 50.0,
              // Set the color and opacity of the header
              color: Colors.grey[900]!.withOpacity(0.6 + stuckAmount * 0.4),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Header #$index',
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
          content: Container(
            child: Image.network('https://killerattitudestatus.in/wp-content/uploads/2019/12/gud-night-images.jpg', fit: BoxFit.cover, width: double.infinity, height: 250.0),
          ),
        );
      }),
    );
  }
}
